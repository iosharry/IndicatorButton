# IndicatorButton

[![CI Status](https://img.shields.io/travis/gwangyonglee/IndicatorButton.svg?style=flat)](https://travis-ci.org/gwangyonglee/IndicatorButton)
[![Version](https://img.shields.io/cocoapods/v/IndicatorButton.svg?style=flat)](https://cocoapods.org/pods/IndicatorButton)
[![License](https://img.shields.io/cocoapods/l/IndicatorButton.svg?style=flat)](https://cocoapods.org/pods/IndicatorButton)
[![Platform](https://img.shields.io/cocoapods/p/IndicatorButton.svg?style=flat)](https://cocoapods.org/pods/IndicatorButton)

Easily manage state values with UIButton with UIActivityIndicatorView (UIButtons include simple animation)

<img src=https://user-images.githubusercontent.com/33976758/75623856-dbbc0600-5bf1-11ea-9f8f-bedfc3f09f5c.gif width=320 height=600>





## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 12+
- Swift 5

## Installation

IndicatorButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IndicatorButton'
```

## Getting Started

### Storyboard Setup

add a 'UIButton' to your Storyboard and set class, module.

![storyboard_setup](https://user-images.githubusercontent.com/33976758/75622884-6992f380-5be8-11ea-9ab3-d28fa7e4cfa4.png)

### Button Animation Setup
```Swift
indicatorButton.type = .shake // case normal, pulse, shake, flash
```

### Animating start & stop 
- Basic
```Swift
// Start 
indicatorButton.startAnimating()


// Stop 
indicatorButton.stopAnimating()
```

- callbackable
```Swift
indicatorButton.startAnimating {
  //
}
		
indicatorButton.stopAnimating {
  //
}
```

### Button State Change
```Swift
indicatorButton.isSelected = !indicatorButton.isSelected
```

## Custommization

### UIButton title color
`titleColor: UIColor` defines the UIButton titleLabel text color. (default is .black)

### UIButton title color(selected)
`selectedTitleColor: UIColor` (default is .white)

### UIButton layer background color
`bgColor: UIColor` defines the UIButton layer backgroundColor. (default is .white)

### UIButton layer background color(selected)
`selectedBgColor: UIColor` (default is .black)

### UIButton layer border color
`borderColor: UIColor` defines the UIButton layer border color. (default is .clear)

### UIButton layer border color(selected)
`selectedBorderColor: UIColor`(default is .clear)

### UIButton layer border width 
`borderWidth: CGFloat` defines the UIButton layer border width. (default is '1.0')

### UIButton layer corner radius 
`cornerRadius: CGFloat` defines the UIButton layer corder radius. (default is '8.0')

### UIButton layer shadow 
`withShadow: Bool` defines the UIButton shadow apply. (default is 'true')

### UIButton layer shadow color
`shadowColor: UIColor` defines the UIButton shadow color. (default is .black)

### UIActivityIndicatorView color
`indicatorColor: UIColor` defines the UIActivityIndicatorView color. (default is .gray)

### UIActivityIndicatorView color(selected)
`selectedIndicatorColor: UIColor` (default is .gray)

## Author

gwangyonglee, gwangyonglee92@gmail.com

## License

IndicatorButton is available under the MIT license. See the LICENSE file for more info.
