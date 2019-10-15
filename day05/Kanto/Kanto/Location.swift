//
//  Location.swift
//  Kanto
//
//  Created by abduraghmaan GABRIELS on 2019/10/14.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import Foundation
import MapKit
class Location{
    var place:Pin
    init(_ place:Pin){
        self.place = place
    }
}

enum Locations{
    case ecole42
    case wtc
    case eiffeltower
    case ggbridge
    
    var instance:Location
    {
        switch self{
        case .ecole42 : return Location(Pin(
            title: "Ecole 42",
            locationName: "96 Boulevard Bessières, 75017 Paris, France",
            discipline: "Coding School",
            coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504)
            ))
        case .wtc : return Location(Pin(
            title: "WeThinkCode",
            locationName: "P3 Terrace Level Portswood",
            discipline: "Coding School",
            coordinate: CLLocationCoordinate2D(latitude: -33.906912, longitude: 18.417353)
        ))
        case .eiffeltower : return Location(Pin(
            title: "Eiffel Tower",
            locationName: "The Tower of Eiffel",
            discipline: "Tower",
            coordinate: CLLocationCoordinate2D(latitude: 48.858382, longitude:2.294496)
        ))
        case .ggbridge:return Location(Pin(
            title: "Golden Gate Bridge",
            locationName: "Somewhere in San Francisco",
            discipline: "Bridge",
            coordinate: CLLocationCoordinate2D(latitude: 37.820115, longitude: -122.478201)
        ))
        }
    }
    static let allLocations:[Location] = [
        Locations.ecole42.instance,
        Locations.wtc.instance,
        Locations.eiffeltower.instance,
        Locations.ggbridge.instance
    ]
}
