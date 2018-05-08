//
//  StaticMapRequestBuilder.swift
//  StaticMapRequestBuilder
//
//  Created by Killian-Kenny on 02/05/2018.
//

import Foundation
import CoreLocation

public enum CenterType {
    case address(String)
    case coordinate(CLLocationCoordinate2D)
}

public enum ImageFormat: String {
    case png
    case gif
    case jpg
}

public enum MapType: String {
    case roadmap
    case terrain
    case satellite
    case hybrid
}

public enum MarkerSize: String {
    case tiny
    case small
    case mid
}

open class MapRequestBuilder {
    
    private var components = URLComponents(string: "https://maps.googleapis.com/maps/api/staticmap")
    
    public init(withSize size: CGSize) {
        let valueString = "\(Int(size.width))x\(Int(size.height))"
        let sizeQuery = URLQueryItem(name: "size", value: valueString)
        components?.queryItems = [sizeQuery]

    }
    
    public func addCenter(_ center: CenterType) -> MapRequestBuilder {
        let centerQuery: URLQueryItem
        
        switch center {
        case .address(let addressString):
            centerQuery = URLQueryItem(name: "center", value: addressString)
        case .coordinate(let coordinate):
            centerQuery = URLQueryItem(name: "center", value: "\(coordinate.latitude),\(coordinate.longitude)")
        }
        
        components?.queryItems?.append(centerQuery)
        return self
    }
    
    public func addZoom(_ level: Int) -> MapRequestBuilder {
        let zoomQuery = URLQueryItem(name: "zoom", value: String(level))
        components?.queryItems?.append(zoomQuery)
        return self
    }
    
    public func imageFormat(_ format: ImageFormat) -> MapRequestBuilder {
        let formatQuery = URLQueryItem(name: "format", value: format.rawValue)
        components?.queryItems?.append(formatQuery)
        return self
    }
    
    public func mapType(_ type: MapType) -> MapRequestBuilder {
        let typeQuery = URLQueryItem(name: "maptype", value: type.rawValue)
        components?.queryItems?.append(typeQuery)
        return self
    }
    
    public func retinaScale() -> MapRequestBuilder {
        let scaleQuery = URLQueryItem(name: "scale", value: String(2))
        components?.queryItems?.append(scaleQuery)
        return self
    }
    
    public func apiKey(_ key: String) -> MapRequestBuilder {
        let keyQuery = URLQueryItem(name: "key", value: key)
        components?.queryItems?.append(keyQuery)
        return self
    }
    
    public func addMarker(_ marker: Marker) ->  MapRequestBuilder {
        
        var queryValue = "\(marker.coordinate.latitude),\(marker.coordinate.longitude)"
        
        if let size = marker.size {
            queryValue = ("size:\(size.rawValue)|\(queryValue)")
        }
        
        if let color = marker.color {
            queryValue = ("color:\(color.hexString)|\(queryValue)")
        }
        
        if let character = marker.label {
            queryValue = ("label:\(character)|\(queryValue)")
        }
        
        let markerQuery = URLQueryItem(name: "markers", value: queryValue)
        components?.queryItems?.append(markerQuery)
        return self
    }
    
    public func build() -> URL? {
        return components?.url
    }
}

public struct Marker {
    let coordinate: CLLocationCoordinate2D
    var size: MarkerSize?
    var color: UIColor?
    var label: Character?
    
    public init(coordinate: CLLocationCoordinate2D,
         size: MarkerSize? = nil,
         color: UIColor? = nil,
         label: Character? = nil) {
        self.coordinate = coordinate
        self.size = size
        self.color = color
        self.label = label
    }
}

extension UIColor {
    
    fileprivate var hexString: String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"0x%06x", rgb)
    }

}
