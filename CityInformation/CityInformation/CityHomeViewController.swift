//
//  CityHomeViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 05/03/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit

class CityHomeViewController: UIViewController {

    
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var cityList: UIButton!
    @IBOutlet weak var faqButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        // Do any additional setup after loading the view.
        search.layer.cornerRadius = 6
        cityList.layer.cornerRadius = 6
        faqButton.layer.cornerRadius = 6
    }
    
    
    @IBAction func showTableAction(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "tableSegue"{
            let destination = segue.destination as! CityTableViewController
        }
        if segue.identifier == "savedSegue"{
            let destination = segue.destination as! CityAccomodationViewController
        }
        
        if segue.identifier == "faqSegue"{
            let destination = segue.destination as! CityFAQViewController
        }
    }

}

