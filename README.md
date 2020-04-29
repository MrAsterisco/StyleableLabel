# StyleableLabel

[![Version](https://img.shields.io/cocoapods/v/StyleableLabel.svg?style=flat)](https://cocoapods.org/pods/StyleableLabel)
[![License](https://img.shields.io/cocoapods/l/StyleableLabel.svg?style=flat)](https://cocoapods.org/pods/StyleableLabel)
[![Platform](https://img.shields.io/cocoapods/p/StyleableLabel.svg?style=flat)](https://cocoapods.org/pods/StyleableLabel)

StyleableLable is a simple UILabel subclass that supports corner radius and directional content insets with AutoLayout out-of-the-box.

## Installation

### CocoaPods

StyleableLabel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StyleableLabel'
```

### Carthage
StyleableLabel can be installed through [Carthage](https://github.com/Carthage/Carthage) by adding this line to your Cartfile:

```
github 'MrAsterisco/StyleableLabel'
```

## Example Project
This library includes a sample project that lets you play around with a StyleableLabel. The example project uses [Combine](https://developer.apple.com/documentation/combine) and runs on iOS 13.4 or later. The main view controller leverages AutoLayout to automatically resize a table view header based on the StyleableLabel content and directional insets.

To see it in action, follow these steps:

- Download this repository.
- Run `pod install` inside the `Example` folder.
- Open `StyleableLabel.xcworkspace`, build and run.

Optionally, to see how it works with Right-to-Left languages, refer to this [guide](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/TestingYourInternationalApp/TestingYourInternationalApp.html). 

## Usage
StyleableLabel is a subclass of UILabel, meaning that you can replace your existing labels with it.

### Properties
StyleableLabel offers two ways to set content insets:

- `directionalEdgeInsets`: set a content inset based on the system layout direction *(iOS 11 or later)*.
- `edgeInsets`: set a fixed content inset.

These two properties are interchangeable: if you set a value in either of them, the other will always return the same value. StyleableLabel will make the appropriate conversions when passing from `directionalEdgeInsets` to `edgeInsets`.

StyleableLabel also provides immediate access to the underlying CALayer's `cornerRadius` property. This can also be set in the Interface Builder.

## Compatibility
StyleableLabel targets **iOS 9.0 or later**. To use directional content insets, **iOS 11 or later** is required.

## Contributions
All contributions to expand the library are welcome. Fork the repo, make the changes you want, and open a Pull Request.

If you make changes to the codebase, I am not enforcing a coding style, but I may ask you to make changes based on how the rest of the library is made.

## Status
This library is under **active development**. Even if most of the APIs are pretty straightforward, **they may change in the future**; but you don't have to worry about that, because releases will follow [Semanting Versioning 2.0.0](https://semver.org).

## License
StyleableLabel is distributed under the MIT license. [See LICENSE](https://github.com/MrAsterisco/StyleableLabel/blob/master/LICENSE) for details.
