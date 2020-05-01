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
import MapboxGeocoder
import Parse

class HomeViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView = GMSMapView()
    var locationManager = CLLocationManager()
    let geocoder = Geocoder(accessToken: "pk.eyJ1IjoiamFncmEyNyIsImEiOiJjazluNjF2aW8wMjQ5M2dsb2s4Yml3N3V3In0.EvZJ4qe_DzaBL72iUiqdRw")
    var chefs = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
       let camera = GMSCameraPosition.camera(withLatitude: 39.3474102, longitude: -76.5881976, zoom: 13)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view.addSubview(mapView)
        getChefLocations()
        mapView.delegate = self
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
    
    func getChefLocations(){
        let query = PFQuery(className: "Chefs")
        query.findObjectsInBackground { (chefs, error) in
            if chefs != nil{
                self.chefs = chefs!
            }
            
            for chef in chefs!{
                let address = "\(String(describing: chef["address"])),\(String(describing: chef["city"])),\(String(describing: chef["state"])) \(String(describing: chef["zipcode"]))"
                
                print(address)
                let options = ForwardGeocodeOptions(query: address)
                
                let task = self.geocoder.geocode(options) { (placemarks, attribution, error) in
                guard let placemark = placemarks?.first else {
                    return
                }
                    let coordinate = placemark.location!.coordinate
                    let marker = GMSMarker()
                    let name = "\(chef["firstname"] as! String) \(chef["lastname"] as! String)"
                    
                    marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
                    print(marker.position)
                    marker.title = name
                    marker.map = self.mapView
                }
            }
        }
    }
}

