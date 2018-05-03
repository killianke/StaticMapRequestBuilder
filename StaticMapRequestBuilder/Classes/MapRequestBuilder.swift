//
//  StaticMapRequestBuilder.swift
//  StaticMapRequestBuilder
//
//  Created by Killian-Kenny on 02/05/2018.
//

import Foundation
import MapKit

public enum ImageFormat: String {
    case png
    case gif
    case jpg
}

open class MapRequestBuilder {
    
    private var components = URLComponents(string: "https://maps.googleapis.com/maps/api/staticmap")
    
    public init(withSize size: CGSize) {
        let valueString = "\(Int(size.width))x\(Int(size.height))"
        let sizeQuery = URLQueryItem(name: "size", value: valueString)
        components?.queryItems = [sizeQuery]

    }
    
    public func addCenter(coordinate: CLLocationCoordinate2D) -> MapRequestBuilder {
        let centerQuery = URLQueryItem(name: "center", value: "\(coordinate.latitude),\(coordinate.longitude)")
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
    
    public func build() -> URL? {
        return components?.url
    }
}
