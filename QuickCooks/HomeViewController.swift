//
//  HomeViewController.swift
//  QuickCooks
//
//  Created by Jada Grant on 4/8/20.
//  Copyright © 2020 Jada Grant. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class HomeViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView = GMSMapView()
    let marker = GMSMarker()
    var locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
       let camera = GMSCameraPosition.camera(withLatitude: 39.3474102, longitude: -76.5881976, zoom: 7)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view = mapView
        mapView.isMyLocationEnabled = true
        
        self.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.stopUpdatingLocation()
    
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("tapped")
        self.performSegue(withIdentifier: "toMenuSegue", sender: nil)
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)

        self.mapView.animate(to: camera)

        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()

    }
    
}

