//
//  Pin.swift
//  Kanto
//
//  Created by abduraghmaan GABRIELS on 2019/10/15.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import Foundation
import MapKit

class Pin: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    let color:UIColor
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        switch (discipline){
            case "Me":
                self.color =  MKPinAnnotationView.redPinColor()
            case "Bridge":
                self.color =  MKPinAnnotationView.greenPinColor()
            case "Tower":
                self.color =  MKPinAnnotationView.redPinColor()
            case "Coding School":
                self.color =  MKPinAnnotationView.purplePinColor()
            default:
                self.color = MKPinAnnotationView.redPinColor()
        }
//        self.color = getColorFromDiscipline(discipline)
        super.init()
    }
    
//    func getColorFromDiscipline(_ discipline:String)->UIColor{
//        var color = MKPinAnnotationView.greenPinColor()
//        switch (discipline){
//            case "Me":
//                color =  MKPinAnnotationView.redPinColor()
//            case "Bridge":
//                color =  MKPinAnnotationView.greenPinColor()
//            case "Tower":
//                color =  MKPinAnnotationView.redPinColor()
//            case "Coding School":
//                color =  MKPinAnnotationView.purplePinColor()
//        default:
//                color = MKPinAnnotationView.redPinColor()
//        }
//        return color
//    }
  
  var subtitle: String? {
    return locationName
  }
}
