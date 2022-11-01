//
//  MapViewController.swift
//  PaketOlsun
//
//  Created by Mehmet Ali Kılıçlı on 1.11.2022.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var hizLabel: UILabel!
    
    @IBOutlet weak var haritaMap: MKMapView!
    
    var locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()

        locationManager.delegate = self
        
        //41.0200145,28.8871701
        
    }
   
}

extension MapViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count - 1]
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        let hiz = sonKonum.speed
        
        hizLabel.text = "Kuryenin hızı : \(hiz) km/s"
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let zoom = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: konum, span: zoom)
        haritaMap.setRegion(bolge, animated: true)
         
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "\(hiz) km/s"
        pin.subtitle = "\(enlem) - \(boylam)"
        haritaMap.addAnnotation(pin)
        
        haritaMap.showsUserLocation = true
        
        
        
        
    }
}
