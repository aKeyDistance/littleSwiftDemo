//
//  ViewController.swift
//  customPin
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var pin : AnnotationPin!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        mapView.mapType = .satellite
        
        
        let coordinate = CLLocationCoordinate2DMake(22.527286, 113.930544)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        
         mapView.setRegion(region, animated:true)
        
        pin = AnnotationPin(title: "fadsf", Subtitle: "5re3qwaf", coordinate: coordinate)
        
        mapView.addAnnotation(pin)
        
        
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "she")
        
        annotationView.image = UIImage(named: "chicken")
        
        let transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        annotationView.transform = transform
        return annotationView
        
    }
}

