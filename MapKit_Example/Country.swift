//
//  Country.swift
//  MapKit_Example
//
//  Created by Lucas Costa  on 04/10/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct Country {
    
    private(set) var name : String
    private(set) var flag : UIImage
    private(set) var location : CLLocation
    
    var coordinate : String {
        return "Location : \(location.coordinate)"
    }
    
}
