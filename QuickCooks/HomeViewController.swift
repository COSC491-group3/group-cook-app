//
//  HomeViewController.swift
//  QuickCooks
//
//  Created by Jada Grant on 4/8/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController, GMSMapViewDelegate {
    
    var mapView = GMSMapView()
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        mapView.delegate = self
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("tapped")
        self.performSegue(withIdentifier: "toMenuSegue", sender: nil)
        return true
    }
    


}

