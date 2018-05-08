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
    
    //MARK: - Properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let empireStatelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1 - Empire State Building"
        return label
    }()
    
    private let flatironlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2 - Flatiron Building"
        return label
    }()
    
    private let chryslerlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3 - Chrysler Building"
        return label
    }()
    
    private var appliedConstraints = false
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NYC Buildings"
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.stackView)
        self.view.setNeedsUpdateConstraints()

        self.stackView.addArrangedSubview(self.empireStatelabel)
        self.stackView.addArrangedSubview(self.flatironlabel)
        self.stackView.addArrangedSubview(self.chryslerlabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let empireStateCoord = CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)
        let empireStateMarker = Marker(coordinate: empireStateCoord,
                                   size: .mid,
                                   color: .green,
                                   label: "1")
        
        let flatironCoord = CLLocationCoordinate2D(latitude: 40.7411, longitude: -73.9897)
        let flatironMarker = Marker(coordinate: flatironCoord,
                                   size: .mid,
                                   color: .green,
                                   label: "2")
        
        let chryslerCoord = CLLocationCoordinate2D(latitude: 40.7516, longitude: -73.9755)
        let chryslerMarker = Marker(coordinate: chryslerCoord,
                                    size: .mid,
                                    color: .green,
                                    label: "3")
        
        let mapUrl = MapRequestBuilder(withSize: self.imageView.bounds.size)
            .addCenter(.address("Midtown Manhattan, New York, NY"))
            .addMarkers([empireStateMarker, flatironMarker, chryslerMarker])
            .addZoom(13)
            .imageFormat(.png)
            .mapType(.roadmap)
            .retinaScale()
            .build()
        
        if let imageUrl = mapUrl {
            imageView.kf.setImage(with: imageUrl)
        }
    }
    
    //MARK: - Constraints
    
    override func updateViewConstraints() {
        if !appliedConstraints {
            NSLayoutConstraint.activate([
                //ImageView
                self.imageView.topAnchor.constraint(equalTo: view.topAnchor),
                self.imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
                self.imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
                self.imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
                
                //StackView
                self.stackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
                self.stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                self.stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
                self.stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
            ])
            self.appliedConstraints = true
        }
        super.updateViewConstraints()
    }

}

