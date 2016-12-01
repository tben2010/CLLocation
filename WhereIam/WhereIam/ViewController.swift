//
//  ViewController.swift
//  WhereIam
//
//  Created by tben on 01.12.16.
//  Copyright © 2016 tben. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    //MARK: - variable's
    var locationManager = CLLocationManager()
    var startLocation:CLLocation!
    
    //MARK: - outlet's
    @IBOutlet weak var latitudeLabelOutlet: UILabel!
    @IBOutlet weak var longitudeLabelOutlet: UILabel!
    @IBOutlet weak var horizontalAccuracyLabelOutlet: UILabel!
    @IBOutlet weak var altitudeLabelOutelt: UILabel!
    @IBOutlet weak var verticalAccuracyLabelOutlet: UILabel!
    @IBOutlet weak var distanceLabelOutlet: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - action's
    @IBAction func resetStartLocation(_ sender: Any) {
        startLocation = nil
    }
    
    
    //MARK: - Delegate Methoden
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let latestLocation: CLLocation = locations[locations.count - 1]
        
        latitudeLabelOutlet.text = String(format: "%.4f",
                               latestLocation.coordinate.latitude)
        longitudeLabelOutlet.text = String(format: "%.4f",
                                latestLocation.coordinate.longitude)
        horizontalAccuracyLabelOutlet.text = String(format: "%.4f",
                                         latestLocation.horizontalAccuracy)
        altitudeLabelOutelt.text = String(format: "%.4f",
                               latestLocation.altitude)
        verticalAccuracyLabelOutlet.text = String(format: "%.4f",
                                       latestLocation.verticalAccuracy)
        
        if startLocation == nil {
            startLocation = latestLocation
        }
        
        let distanceBetween: CLLocationDistance =
            latestLocation.distance(from: startLocation)
        
        distanceLabelOutlet.text = String(format: "%.2f", distanceBetween)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }


}

