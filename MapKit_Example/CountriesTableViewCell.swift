//
//  CountriesTableViewCell.swift
//  MapKit_Example
//
//  Created by Lucas Costa  on 04/10/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var nameCountry: UILabel!
    private(set) var country : Country?
    
    var location : Country? {
        didSet {
            self.flag.image = location?.flag
            self.nameCountry.text = location?.name
            self.country = location
        }
    }

}
