//
//  GPSViewController.swift
//  Program 7 Weakland
//
//  Created by Lucas Weakland on 4/8/20.
//  Copyright © 2020 Lucas Weakland. All rights reserved.
//
import UIKit
import CoreLocation

class GPSViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let sanibelLatitude: CLLocationDegrees = 26.443398
    let sanibelLongitude: CLLocationDegrees = -82.111511
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        if newLocation.horizontalAccuracy >= 0 {
            
            let my:CLLocation = CLLocation(latitude: sanibelLatitude,longitude:sanibelLongitude)
            let delta:CLLocationDistance = my.distance(from: newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5
            let commaDelimited: NumberFormatter = NumberFormatter()
            commaDelimited.numberStyle = NumberFormatter.Style.decimal
    distanceLabel.text = "I am " + commaDelimited.string(from: NSNumber(value: miles))!+" miles away!"
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Second Tab
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609;
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
        
      
        
        
        
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
