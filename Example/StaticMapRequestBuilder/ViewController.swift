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
import MapKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = imageView
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        
        let coordinate = CLLocationCoordinate2D(latitude: 52.980778, longitude: -6.046528)
        let mapUrl = MapRequestBuilder(withSize: CGSize(width: 300, height: 200))
            .addCenter(coordinate: coordinate)
            .addZoom(12)
            .imageFormat(.png)
            .build()
        
        print("Map URL: \(String(describing: mapUrl))")
        if let imageUrl = mapUrl {
            imageView.kf.setImage(with: imageUrl)
        }
    }

}

