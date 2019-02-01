//
//  PhotoAndMapViewController.swift
//  Photos
//
//  Created by R. Kukuh on 01/02/19.
//  Copyright © 2019 R. Kukuh. All rights reserved.
//

import UIKit

class PhotoAndMapViewController: UIViewController {
    
    var selectedPhoto: Photo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photo = selectedPhoto {
            self.title = photo.name
        }
    }
}
