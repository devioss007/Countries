//
//  CustomMapView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit
import MapKit

final class CustomMapView: MKMapView {
    func setContent(x: Double, y: Double, radius: Double, areaName: String) {
        let initialLocation = CLLocation(latitude: x, longitude: y)
        let regionRadius: CLLocationDistance = radius
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)

        let city = MKPointAnnotation()
        city.title = areaName
        city.coordinate = CLLocationCoordinate2D(latitude: x, longitude: y)
        addAnnotation(city)
    }
}

