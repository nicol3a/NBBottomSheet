# NBBottomSheet

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/NBBottomSheet.svg)](http://cocoapods.org/pods/NBBottomSheet)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platform](https://img.shields.io/cocoapods/p/NBBottomSheet.svg)](http://www.apple.com/ios/)
[![License](https://img.shields.io/github/license/nicol3a/NBBottomSheet.svg)](https://github.com/nicol3a/NBBottomSheet/blob/master/LICENSE)

**NBBottomSheet** is an open-source iOS library that allows you to present a `UIViewController` in a bottom sheet.

![Demo](https://user-images.githubusercontent.com/1519558/48593544-3a853f80-e91b-11e8-80eb-20b612d524d6.gif)

## Requirements

* iOS 9.0+
* Xcode 11+
* Swift 5.0

## Installation

### CocoaPods

To integrate NBBottomSheet into your Xcode project using [CocoaPods](http://cocoapods.org), specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'NBBottomSheet', '~> 1.2'
end

```

Then, run the following command:

```bash
$ pod install
```

### Carthage

To integrate NBBottomSheet into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```ogdl
github "nicol3a/NBBottomSheet" ~> 1.1
```

Then, run the following command:

```bash
$ carthage update
```

Drag the built `NBBottomSheet.framework` from the Carthage build folder into the “Embedded Binaries” section in the "General" panel of the application target.

### Manually

Add NBBottomSheet as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add -b master https://github.com/nicol3a/NBBottomSheet.git
```

Drag the `NBBottomSheet.xcodeproj` file into your project and add the `NBBottomSheet.framework` in the "Embedded Binaries" section in the "General" panel of the application target.

## Usage

Initialize an instance of [`NBBottomSheetController`](https://github.com/nicol3a/NBBottomSheet/blob/master/NBBottomSheet/NBBottomSheet/Sources/NBBottomSheetController.swift):

```swift
let bottomSheetController = NBBottomSheetController()
```

To display a view controller in a bottom sheet, add the following code where you want to display the bottom sheet, passing the view controller to present and the container view controller:

```swift
let viewController = AlertViewController()
bottomSheetController.present(viewController, on: self)
```

> **Note:** Be sure to keep a strong reference to your instance of [`NBBottomSheetController`](https://github.com/nicol3a/NBBottomSheet/blob/master/NBBottomSheet/NBBottomSheet/Sources/NBBottomSheetController.swift) for the duration of its use.

If you don’t want to use [`NBBottomSheetController`](https://github.com/nicol3a/NBBottomSheet/blob/master/NBBottomSheet/NBBottomSheet/Sources/NBBottomSheetController.swift)’s default configuration, you can specify a [`NBBottomSheetConfiguration`](https://github.com/nicol3a/NBBottomSheet/blob/master/NBBottomSheet/NBBottomSheet/Sources/NBBottomSheetConfiguration.swift) instance on initialization of [`NBBottomSheetController`](https://github.com/nicol3a/NBBottomSheet/blob/master/NBBottomSheet/NBBottomSheet/Sources/NBBottomSheetController.swift).

```swift
let configuration = NBBottomSheetConfiguration(animationDuration: 0.4, sheetSize: .fixed(300))
let bottomSheetController = NBBottomSheetController(configuration: configuration)
```

## License

NBBottomSheet is available under the MIT license. See the [`LICENSE`](https://github.com/nicol3a/NBBottomSheet/blob/master/LICENSE) file for more information.

## Acknowledgements

- Created with ❤️ by [Nicolas Bichon](https://twitter.com/nicol3a)