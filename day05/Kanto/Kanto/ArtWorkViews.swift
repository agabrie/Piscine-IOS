//
//  ArtWorkViews.swift
//  Kanto
//
//  Created by abduraghmaan GABRIELS on 2019/10/15.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class ArtworkMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let artwork = newValue as? Artwork else { return }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
      // 2
      markerTintColor = artwork.markerTintColor
      glyphText = String(artwork.discipline.first!)
    }
  }
}
