//
//  LocationViewController.swift
//  Kanto
//
//  Created by abduraghmaan GABRIELS on 2019/10/14.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {
//    var locations:[Location] = []
    var locations:[Location] = Locations.allLocations
    var index:Int = 0
//    var mapViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
    @IBOutlet var locationView: LocationListController!
        override func viewDidLoad() {
            super.viewDidLoad()
            createArray()
            locationView.delegate = self
            locationView.dataSource = self
        }
        func createArray(){
//            locations.append(Location(Pin(
//                title: "Ecole 42",
//                locationName: "96 Boulevard Bessières, 75017 Paris, France",
//                discipline: "Coding School",
//                coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504)
//            )))
//            locations.append(Location(Pin(
//                title: "WeThinkCode",
//                locationName: "P3 Terrace Level Portswood",
//                discipline: "Coding School",
//                coordinate: CLLocationCoordinate2D(latitude: -33.906912, longitude: 18.417353)
//            )))
//            locations.append(Location(Pin(
//                title: "Eiffel Tower",
//                locationName: "The Tower of Eiffel",
//                discipline: "Tower",
//                coordinate: CLLocationCoordinate2D(latitude: 48.858382, longitude:2.294496)
//            )))
//            locations.append(Location(Pin(
//                title: "Golden Gate Bridge",
//                locationName: "Somewhere in San Francisco",
//                discipline: "Bridge",
//                coordinate: CLLocationCoordinate2D(latitude: 37.820115, longitude: -122.478201)
//            )))
//            locations.append(Location(place:"banana1"))
//            locations.append(Location(place:"banana2"))
//            locations.append(Location(place:"banana3"))
//            locations.append(Location(place:"banana4"))
        }
        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LocationViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        loadMapViewScreen(index: index)
        print (indexPath.row)
    }
        
    func loadMapViewScreen(index: Int) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
////        storyBoard.
//        let mapViewController = MapViewController()
//        let mapViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
////        self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
            let mapViewController = self.tabBarController?.viewControllers![1] as! MapViewController
            mapViewController.locationSearch = locations[index]
            mapViewController.allLocations = locations
            goToView(row: 1)
//        self.performSegue(withIdentifier: "toMap", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        if segue.identifier == "ShowCounterSegue",
//         if let destinationVC = segue.destination as? MapViewController {
//                destinationVC.locationSearch = locations[index]
//                destinationVC.allLocations = locations
//        }
//    }
    
    func goToView(row: Int) {
        tabBarController?.selectedIndex = row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = locations[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:  "tvcPlace") as! tvcPlace
        cell.setText(name: note.place.title!)
        return cell
    }
}
