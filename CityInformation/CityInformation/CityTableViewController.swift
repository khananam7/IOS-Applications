//
//  CityTableViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 17/02/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit
class HeadlineTableViewCell: UITableViewCell{
        
    @IBOutlet weak var headlineText: UILabel!
    @IBOutlet weak var headlineTitle: UILabel!
    @IBOutlet weak var headlineImage: UIImageView!
}


class CityTableViewController: UITableViewController {

    
    
    //model data
    var citiesData : CityList!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.title = "List of Cities"
        citiesData = CityList(fromContentOfXML: "cities.xml")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citiesData.count()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return tableView.frame.height
         return 220
    }
  
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeadlineTableViewCell
        // Configure the cell...
        
         let cityData = citiesData.cityData(index: indexPath.row)
         cell.headlineTitle.text = cityData.name
         cell.headlineText.text = cityData.country
         cell.headlineImage.image = UIImage(named: cityData.image)
         return cell
      
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! CityViewController
        let indexPath =  self.tableView.indexPath(for: sender as! UITableViewCell)
        destination.cityData = citiesData.cityData(index: (indexPath?.row)!)
    }
 

}
