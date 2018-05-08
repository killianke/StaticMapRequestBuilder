//
//  ViewController.swift
//  StaticMapRequestBuilder
//
//  Created by Killian Kenny on 05/02/2018.
//  Copyright (c) 2018 Killian Kenny. All rights reserved.
//

import UIKit
import Kingfisher
import StaticMapRequestBuilder
import CoreLocation

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = imageView
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        
        let wicklow = CLLocationCoordinate2D(latitude: 52.980778, longitude: -6.046528)
        let rathnew = CLLocationCoordinate2D(latitude: 52.985642, longitude: -6.053813)
        
        let wicklowMarker = Marker(coordinate: wicklow, size: .mid, color: .purple, label: "1")
        let rathnewMarker = Marker(coordinate: rathnew, size: .large)
        
        let mapUrl = MapRequestBuilder(withSize: CGSize(width: 300, height: 200))
            //.addCenter(.coordinate(coordinate))
            .addCenter(.address("Wicklow, Co. Wicklow"))
            .addZoom(12)
            .imageFormat(.png)
            .mapType(.roadmap)
            .retinaScale()
            .addMarkers([wicklowMarker, rathnewMarker])
            .build()
        
        print("Map URL: \(String(describing: mapUrl))")
        if let imageUrl = mapUrl {
            imageView.kf.setImage(with: imageUrl)
        }
    }

}

