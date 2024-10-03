//
//  MapViewController.swift
//  Trackers
//
//  Created by Jose Preatorian on 01-10-24.
//  Copyright © 2024 Sheldon. All rights reserved.
//

import UIKit
import MapKit

@available(iOS 11.0, *)
class MapViewController: UIViewController {

    var latitude: Double?
    var longitude: Double?

    private let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        setupViews()
        displayLocation()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(mapView)

       
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func displayLocation() {
        guard let latitude = latitude, let longitude = longitude else { return }
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)

        mapView.setRegion(region, animated: true)

        // Añadir un pin en la ubicación
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Ubicación"
        mapView.addAnnotation(annotation)
    }
}
