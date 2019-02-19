//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Cara on 2/18/19.
//  Copyright © 2019 Cara. All rights reserved.
//
import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func loadView() {
        // create a map view
        mapView = MKMapView()
        
        // set it as *the* view of this view controller
        view = mapView
        
        // add a button
        // got some help for this from this tutorial https://www.codevscolor.com/ios-create-button-programmatically/
    
        let button = UIButton(type: .system)
        
        let buttonX = 150
        let buttonY = 150
        let buttonWidth = 100
        let buttonHeight = 50
        
        button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        button.setTitle("Where Am I?", for: .normal)
        self.view.addSubview(button)
        
        // add a UISegmentedControl to allow the user to choose between different options for view
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self,
                                   action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        // this is to turn off the older auto-resizing mask so it doesn't conflict
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        // add constraints
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("map view appears")
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .hybrid
            case 2:
                mapView.mapType = .satellite
            default:
                break
        }
    }
}
