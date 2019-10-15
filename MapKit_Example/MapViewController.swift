//
//  MapViewController.swift
//  MapKit_Example
//
//  Created by Lucas Costa  on 04/10/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    var country : Country?
    private var point : MKPointAnnotation!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) 
        
        guard let country = country else {return}
        
        self.point = MKPointAnnotation()
        self.point.coordinate = country.location.coordinate
        self.point.title = country.name
        self.map.addAnnotation(self.point)
        
        self.map.delegate = self
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(location: self.country!.location)
    }
    
    func centerMapOnLocation(location : CLLocation) {
        
        let radius : CLLocationDistance = 1000
        
        self.map.setRegion(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius), animated: true)
    }
}

extension MapViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation")
        
        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
        annotationView?.canShowCallout = true
    
        return annotationView
    }
    
    
}
