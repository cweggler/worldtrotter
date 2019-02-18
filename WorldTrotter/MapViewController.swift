//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Cara on 2/18/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        // create a map view
        mapView = MKMapView()
        
        // set it as *the* view of this view controller
        view = mapView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("map view appears")
    }
}
