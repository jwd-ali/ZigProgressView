<img src="https://github.com/jwd-ali/TidalTestProject/blob/master/images/header/header.png">
<img align="right" src="https://github.com/jwd-ali/ZigProgressView/blob/master/Images/ezgif.com-video-to-gif-31.gif"  width = "420"/>

# ZigProgressView
> Add zigzag Progress Animation in just 2 steps in your view

[![CI Status](https://travis-ci.org/jwd-ali/RingPieChart.svg)](https://travis-ci.org/jwd-ali/RingPieChart)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/Drag3DRotateCard.svg?style=flat)](https://cocoapods.org/pods/Drag3DRotateCard)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-0473B3.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/RingPieChart.svg?style=flat)](https://cocoapods.org/pods/Drag3DRotateCard)
[![Platform](https://img.shields.io/cocoapods/p/RingPieChart.svg?style=flat)](https://cocoapods.org/pods/Drag3DRotateCard)
[![Swift 5.1](https://img.shields.io/badge/swift-5.1-orange)](https://swift.org)


___

<p> 
  

<a href="https://www.linkedin.com/in/jawad-ali-3804ab24/"><img src="https://i.imgur.com/vGjsQPt.png" width="134" height="34"></a>  

</br></br>


## Requirements

- iOS 10.0+ / Mac OS X 10.9+ / watchOS 2.0+ / tvOS 9.0+
- Xcode 8.0+


## Installation

### [CocoaPods](http://cocoapods.org)

To integrate **ZigProgressView** into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'ZigProgressView'
```

Then, run the following command:

```bash
$ pod install
```
### [Carthage](http://github.com/Carthage/Carthage)

To integrate `ZigProgressView` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "jwd-ali/ZigProgressView"
```
### Manually

If you prefer not to use a dependency manager, you can integrate **ZigProgressView** into your project manually.

- Add sources into your project:
  - Drag `ZProgressView.swift` and `CALayer+Extension.swift`

  ## Usage
  
> If you are using any dependency manager (pods , carthage , package manager)to integrate JProgressView. Import ProgressView first:
> ```swift
> import ZProgressView
> ```

> And for Manuall install you dont need to import anything 


You need to simply initiate progressView with four colours if you want to customise colors  initiate  like this

> ```swift
> var progessView = ZProgressView() 
> ```

**OR**

> ```swift
>  private lazy var progessView: ZProgressView = {
>        let progress = ZProgressView()
>        progress.color = .black
>        progress.strokeWidth = 25
>       return progress
    }()
> ```

Then in which view you want to show progress call

> ```swift
>progessView.StartAnimating(in: self.view)
> ```

To stop and hide call

> ```swift
> progessView.stopAnimating()
> ```

For better understanding framework includes example project as well
 
 Congratulations! You're done.




## Contributing

I’d love to have help on this project. For small changes please [open a pull request](https://github.com/jwd-ali/ZigProgressView/pulls), for larger changes please [open an issue](https://github.com/jwd-ali/ZigProgressView/issues) first to discuss what you’d like to see.


License
-------

ZigProgressView is under [MIT](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) file for more info.
