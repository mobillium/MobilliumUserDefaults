# MobilliumUserDefaults

[![CI Status](https://img.shields.io/travis/aslanmehmetsalih/MobilliumUserDefaults.svg?style=flat)](https://travis-ci.org/aslanmehmetsalih/MobilliumUserDefaults)
[![Version](https://img.shields.io/cocoapods/v/MobilliumUserDefaults.svg?style=flat)](https://cocoapods.org/pods/MobilliumUserDefaults)
[![License](https://img.shields.io/cocoapods/l/MobilliumUserDefaults.svg?style=flat)](https://cocoapods.org/pods/MobilliumUserDefaults)
[![Platform](https://img.shields.io/cocoapods/p/MobilliumUserDefaults.svg?style=flat)](https://cocoapods.org/pods/MobilliumUserDefaults)

## Requirements
- iOS 8.0+

## Installation

MobilliumUserDefaults is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MobilliumUserDefaults'
```

## Usage

Set defaults(optional):
```swift
Defaults = UserDefaults.standard // or default is UserDefaults.standard
```

Create you DefaultsKey:
```swift
import MobilliumUserDefaults

extension DefaultsKey {
    static let stringKey = Key<String>(key: "stringKey")
    static let intKey = Key<Int>(key: "intKey")
    static let boolKey = Key<Bool>(key: "boolKey")
    static let doubleKey = Key<Double>(key: "doubleKey")
    static let dateKey = Key<Date>(key: "dateKey")
    static let arrayKey = Key<[String]>(key: "arrayKey")
}
```

Save value:
```swift
let value = "string"
DefaultsKey.stringKey.value = value
```

Get value:
```swift
let value = DefaultsKey.stringKey.value
```

Check value:
```swift
if DefaultsKey.stringKey.has { 
    //
}
```

Remove value:
```swift
DefaultsKey.stringKey.value = nil
//or
DefaultsKey.stringKey.remove()
```

Remove all values:
```swift
Defaults.removeAll()
```

## License

MobilliumUserDefaults is available under the MIT license. See the LICENSE file for more info.
