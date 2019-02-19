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
        
        // add a UISegmentedControl to allow the user to choose between different options for view
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        // this is to turn off the older auto-resizing mask so it doesn't conflict
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("map view appears")
    }
}
