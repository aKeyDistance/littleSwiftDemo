//
//  AnnotationPin.swift
//  customPin
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import Foundation

import MapKit


class AnnotationPin: NSObject, MKAnnotation {
    
    var title : String?
    var subtitle: String?
    
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, Subtitle:String, coordinate :CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = Subtitle
        self.coordinate = coordinate
    }
    
}
