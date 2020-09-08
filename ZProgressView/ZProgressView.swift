//
//  Cpath.swift
//  bPath
//
//  Created by Jawad Ali on 07/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit

@IBDesignable public class ZProgressView: UIView {
    
    //MARK:- Properties
    public var color: UIColor = #colorLiteral(red: 0.07366103679, green: 0.5809653997, blue: 0.9120218158, alpha: 1) {
        didSet {
            setNeedsDisplay()
        }
    }
    public var strokeWidth: CGFloat = 20 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var speed: Double = 1
    
    //MARK:- Views
    private lazy var shapeLayerA:CAShapeLayer = {
        let circularLayer = CAShapeLayer()
        circularLayer.fillColor = UIColor.clear.cgColor
        circularLayer.strokeColor = color.cgColor
        circularLayer.lineWidth = strokeWidth
        circularLayer.lineCap = .round
        return circularLayer
    }()
    
    private lazy var shapeLayerB:CAShapeLayer = {
        let circularLayer = CAShapeLayer()
        circularLayer.fillColor = UIColor.clear.cgColor
        circularLayer.strokeColor = color.cgColor
        circularLayer.lineWidth = strokeWidth
        circularLayer.lineCap = .round
        return circularLayer
    }()
    
    //MARK:- Initializers
    
    convenience public init (with color: UIColor) {
        self.init(frame:.zero)
        self.color = color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        controlDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        controlDidLoad()
    }
    
    
    //MARK: View Life cycle
    
    private func controlDidLoad(){
        layer.addSublayer(shapeLayerB)
        layer.addSublayer(shapeLayerA)
        
        shapeLayerB.strokeEnd = 1
        shapeLayerA.strokeEnd = 0
    }
    
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        updatePath()
    }
    
    public override func layoutSubviews() {
        updatePath()
    }
    
    private func updatePath() {
        let frame1 = CGRect(origin: CGPoint(x: -bounds.midX/2, y: strokeWidth/2), size: CGSize(width: bounds.width/2, height: bounds.height-strokeWidth))
        let frame2 = CGRect(origin: CGPoint(x: bounds.midX - bounds.midX/2, y: strokeWidth/2), size: CGSize(width: bounds.width/2, height: bounds.height-strokeWidth))
        
        shapeLayerA.frame = frame1
        shapeLayerB.frame = frame2
        
        shapeLayerA.path = createSignWavePathC(with: frame1)
        shapeLayerB.path = createSignWavePathB(with: frame2)
    }
    
    
    
    private func setUpConstraints(with view: UIView) {
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    //MARK:- Start & Stop Animation
    
    @objc public func startAnimating(in view : UIView , isConstraintsSet:Bool = false) {
        
        view.addSubview(self)
        if !isConstraintsSet {
            setUpConstraints(with: view)
        }
        layoutIfNeeded()
        
        shapeLayerB.strokeAnimation(duration: speed,from:1 , to:0)
        shapeLayerA.strokeAnimation(duration: speed,from:0,to:1)
        
        let frameA = CGRect(origin: CGPoint(x: bounds.midX + bounds.midX/2 , y: strokeWidth/2), size: CGSize(width: self.bounds.midX, height: self.bounds.height))
        
        self.shapeLayerA.animatePosition(xPoint: shapeLayerB.position.x, duration: speed)
        self.shapeLayerB.animatePosition(xPoint:frameA.midX , duration: speed)
    }
    
    
    public func stopAnimating() {
        
        layer.removeAllAnimations()
        self.removeFromSuperview()
    }
}

//MARK:- path of the wave
private extension ZProgressView {
    
    func createSignWavePathB(with waveBound:CGRect) -> CGPath {
        let bezierPath2 = UIBezierPath()
        let waveRadius = waveBound.width/4
        bezierPath2.move(to: CGPoint(x: 0, y: waveBound.height - waveRadius))
        bezierPath2.addLine(to: CGPoint(x:0  , y: waveRadius))
        bezierPath2.addArc(withCenter: CGPoint(x: waveRadius, y:  waveRadius), radius: waveRadius, startAngle: 180.degreesToRadians, endAngle: 0.degreesToRadians, clockwise: true)
        bezierPath2.addLine(to: CGPoint(x: waveRadius*2 , y: waveBound.height - waveRadius))
        bezierPath2.addArc(withCenter: CGPoint(x:  waveRadius*3, y:  waveBound.height - waveRadius), radius: waveRadius, startAngle: 180.degreesToRadians, endAngle: 0.degreesToRadians, clockwise: false)
        
        return bezierPath2.cgPath
    }
    
    func createSignWavePathC(with waveBound:CGRect) -> CGPath {
        let bezierPath2 = UIBezierPath()
        let waveRadius = waveBound.width/4
        
        bezierPath2.move(to: CGPoint(x: waveBound.width, y: waveBound.height-waveRadius))
        
        
        bezierPath2.addArc(withCenter: CGPoint(x: waveBound.width - waveRadius , y: waveBound.height - waveRadius), radius: waveRadius , startAngle: 0.degreesToRadians, endAngle: 180.degreesToRadians, clockwise: true)
        
        bezierPath2.addLine(to: CGPoint(x:waveBound.width - waveRadius*2  , y: waveRadius))
        
        bezierPath2.addArc(withCenter: CGPoint(x:waveBound.width - waveRadius*3, y:  waveRadius), radius: waveRadius, startAngle: 0.degreesToRadians, endAngle: 180.degreesToRadians, clockwise: false)
        
        bezierPath2.addLine(to: CGPoint(x: waveBound.width - waveRadius*4 , y: waveBound.height - waveRadius))
        
        return bezierPath2.cgPath
    }
}
