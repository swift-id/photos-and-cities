//
//  PhotoAndMapViewController.swift
//  Photos
//
//  Created by R. Kukuh on 01/02/19.
//  Copyright © 2019 R. Kukuh. All rights reserved.
//

import UIKit
import MapKit

class PhotoAndMapViewController: UIViewController {
    
    var selectedPhoto: Photo?
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photo = selectedPhoto {
            self.title = photo.name
            
            imageView.image = UIImage(named: photo.fileName)
            
            let coordinate = CLLocationCoordinate2D.init(latitude: photo.latitude,
                                                         longitude: photo.longitude)
            
            let zoom = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
            
            map.setRegion(MKCoordinateRegion.init(center: coordinate, span: zoom),
                          animated: true)
        }
    }
}
