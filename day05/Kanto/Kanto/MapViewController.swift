//
//  MapViewController.swift
//  Kanto
//
//  Created by abduraghmaan GABRIELS on 2019/10/14.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController{
    var locationSearch:Location = Locations.ecole42.instance
    var allLocations:[Location] = Locations.allLocations
    @IBOutlet var mapTypeSelect: UISegmentedControl!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location to ecole42
        locationManager.requestAlwaysAuthorization()

        // For use in foreground
        locationManager.requestWhenInUseAuthorization()
        
        for location in allLocations{
//            switch(location.place
            mapView.addAnnotation(location.place)
        }
//        mapView.addAnnotation(locationSearch.place)
//
//        centerMapOnLocation(location: CLLocation(latitude: locationSearch.place.coordinate.latitude, longitude: locationSearch.place.coordinate.longitude))
    }
    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestAlwaysAuthorization()

        // For use in foreground
        locationManager.requestWhenInUseAuthorization()
        
        
        
        centerMapOnLocation(location: CLLocation(latitude: locationSearch.place.coordinate.latitude, longitude: locationSearch.place.coordinate.longitude))
    }
    @IBAction func getLocation(_ sender: Any) {
        something()
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch mapTypeSelect.selectedSegmentIndex
        {
        case 0:
            mapView.mapType = .standard
            break
        case 1:
            mapView.mapType = .satellite
            break
        case 2:
            mapView.mapType = .hybrid
            break
        default:
            break
        }
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
    }

}

extension MapViewController: CLLocationManagerDelegate,MKMapViewDelegate {
    func something(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        let myLoc = locationManager.location?.coordinate
        centerMapOnLocation(location: CLLocation(latitude: myLoc!.latitude, longitude: myLoc!.longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        
//        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: locValue, latitudinalMeters: 1000,longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = Pin(title: "Me",
        locationName: "Current Location",
        discipline: "Me",
        coordinate: CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude))
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = locValue
//        annotation.title = "Javed Multani"
//        annotation.subtitle = "current location"
        
//        mapView.addAnnotation(annotation)
    }
}
