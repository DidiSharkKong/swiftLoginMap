//
//  MapView.swift
//  swiftLoginMap
//
//  Created by Didi on 28/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let centerLocation = CLLocationCoordinate2D(latitude: 47.3215, longitude: 5.04147)
        let region = MKCoordinateRegion(center: centerLocation, latitudinalMeters: CLLocationDistance(exactly: 20000)!, longitudinalMeters: CLLocationDistance(exactly: 20000)!)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        
        for appartment in appartmentData {
            let annotation = MKPointAnnotation()
            annotation.title = appartment.name
            print(appartment.name)
            annotation.subtitle = appartment.description
//            annotation.imageName = "immoPicto"
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(appartment.latitude), longitude: CLLocationDegrees(appartment.longitude))
            mapView.addAnnotation(annotation)
        }
        return mapView
    }
    
//    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
//
//        if !(annotation is CustomPointAnnotation) {
//            return nil
//        }
//
//        let reuseId = "test"
//
//        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
//        if anView == nil {
//            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            anView!.canShowCallout = true
//        }
//        else {
//            anView!.annotation = annotation
//        }
//
//        //Set annotation-specific properties **AFTER**
//        //the view is dequeued or created...
//
//        let cpa = annotation as! CustomPointAnnotation
//        anView!.image = UIImage(named:cpa.imageName)
//
//        return anView
//    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
       
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent:MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
}

//class CustomPointAnnotation: MKPointAnnotation {
//    var imageName: String!
//}