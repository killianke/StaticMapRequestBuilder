//
//  ViewController.swift
//  StaticMapRequestBuilder
//
//  Created by Killian Kenny on 05/02/2018.
//  Copyright (c) 2018 Killian Kenny. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = imageView
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        
        if let imageUrl = URL(string: "https://thumbs.dreamstime.com/b/tropical-fish-colourful-sixspine-butterfly-fish-7820672.jpg") {
            imageView.kf.setImage(with: imageUrl)
        }
    }

}

