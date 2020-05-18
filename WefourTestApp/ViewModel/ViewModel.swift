//
//  ViewModel.swift
//  WefourTestApp
//
//  Created by Rajesh M on 16/05/20.
//  Copyright © 2020 Rajesh M. All rights reserved.
//

import Foundation
import GoogleMaps

public class ViewModel {
    
    func parseJSON(filename fileName: String) -> [ORderReuest]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([ORderReuest].self, from: data)
                return jsonData
                
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func drawPath(from polyStr: String, mapView: GMSMapView){
        let path = GMSPath(fromEncodedPath: polyStr)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 5.0
        polyline.map = mapView // Google MapView
    }
    
    
}


extension UIImageView {
    
    func rounded() {
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
