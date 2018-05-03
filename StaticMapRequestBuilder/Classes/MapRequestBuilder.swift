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
    
    public func build() -> URL? {
        return components?.url
    }
}
