# StaticMapRequestBuilder

[![CI Status](https://img.shields.io/travis/Killian Kenny/StaticMapRequestBuilder.svg?style=flat)](https://travis-ci.org/Killian Kenny/StaticMapRequestBuilder)
[![Version](https://img.shields.io/cocoapods/v/StaticMapRequestBuilder.svg?style=flat)](https://cocoapods.org/pods/StaticMapRequestBuilder)
[![License](https://img.shields.io/cocoapods/l/StaticMapRequestBuilder.svg?style=flat)](https://cocoapods.org/pods/StaticMapRequestBuilder)
[![Platform](https://img.shields.io/cocoapods/p/StaticMapRequestBuilder.svg?style=flat)](https://cocoapods.org/pods/StaticMapRequestBuilder)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

StaticMapRequestBuilder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StaticMapRequestBuilder'
```

## Usage

### Quick Start

```swift

let coordinate = CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)
let marker = Marker(coordinate: coordinate, color: .blue)
let mapSize = CGSize(width: 300, height: 200)

let mapRequestUrl = MapRequestBuilder(withSize: mapSize)
.addCenter(.address("Midtown Manhattan, New York, NY"))
.addMarker(marker)
.addZoom(13)
.imageFormat(.png)
.mapType(.roadmap)
.retinaScale()
.build()

```

## Author

Killian Kenny, killiankenny21@gmail.com

## License

StaticMapRequestBuilder is available under the MIT license. See the LICENSE file for more info.
