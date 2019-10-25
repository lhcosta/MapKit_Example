//
//  ViewController.swift
//  MapKit_Example
//
//  Created by Lucas Costa  on 04/10/19.
//  Copyright © 2019 LucasCosta. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    //MARK:- Properties
    var countries : [Country]!
    @IBOutlet weak var tableViewCountries: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.countries = [Country]()
        
        self.countries.append(Country(name: "Brazil", flag: UIImage(named: "brazil")!, location: CLLocation(latitude: .init(floatLiteral: -15.7215857), longitude: .init(floatLiteral: -48.0073977))))
        
        self.countries.append(Country(name: "England", flag: UIImage(named: "england")!, location: CLLocation(latitude: .init(floatLiteral: 53.4723272), longitude: .init(floatLiteral: -2.2935021))))
        
        self.countries.append(Country(name: "Japan", flag: UIImage(named: "japan")!, location: CLLocation(latitude: .init(floatLiteral: 35.5090627), longitude: .init(floatLiteral: 139.2093911))))
        
        self.tableViewCountries.dataSource = self
        self.tableViewCountries.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let view = segue.destination as? MapViewController else {return}
        view.country = sender as? Country
    }
    

}

//MARK:- UITableViewDataSource
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountriesTableViewCell
        
        cell.location = countries[indexPath.row]
        
        return cell
    }

}

//MARK:- UITableViewDelegate
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CountriesTableViewCell
        let country = cell.country
        
        performSegue(withIdentifier: "CountrySelected", sender: country)
    }
    
}



