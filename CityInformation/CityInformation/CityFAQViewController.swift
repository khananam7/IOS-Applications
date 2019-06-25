//
//  CityFAQViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 07/03/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit

class CityFAQViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableCell: UITableView!
    
    @IBOutlet weak var queryTextView: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func submitACtion(_ sender: UIButton) {
   queryTextView.text = ""
    }
    
    //  var faqsData : faqs!
     var faqArray = [faq]()
    var searchQuestion = [faq]() //updatedTableAfterSearch
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FAQ"
        searchBar.delegate = self
        searchBar.placeholder = "Search by Question"
        tableCell.isScrollEnabled = true
        submitButton.layer.cornerRadius = 6
        // Do any additional setup after loading the view.
        setUpData()
        
    }
    func setUpData() {
        faqArray.append(  faq(question: "Things to do in London", answer: "Visit the Tower Bridge, Buckingham Palace, St. Pauls Cathedral"))
        
        faqArray.append(   faq(question: "Things to do in Paris", answer: "Visit the Eiffel Tower, Musee d'Orsay, The Lourve"))
        
        faqArray.append( faq(question: "Things to do in Stockholm", answer: "Visit the Army Museum, Bonniers konsthall"))
        
        faqArray.append( faq(question: "Things to do in Venice", answer: "Visit the Venice Carnival, Saint Mark's Basilica, Harry's Bar"))
        faqArray.append(      faq(question: "Things to do in Prague", answer: "Visit the Charles Bridge, Prague Castle"))
        faqArray.append( faq(question: "Things to do in Budapest", answer: "Visit the Hungarian Parliament Building, Buda Castle"))
        faqArray.append( faq(question: "Things to do in Barcelona", answer: "Visit the Gothic Quarter, La Sagrada Familia"))
        searchQuestion = faqArray
    }
    
}
    extension CityFAQViewController: UITableViewDataSource,UITableViewDelegate{
         func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            //return faqsData.count()
            return searchQuestion.count
        }
        
        
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            // Configure the cell...
            
//            let faq = faqsData.faqData(index: indexPath.row)
//            cell.textLabel!.text = faq.question
//            cell.detailTextLabel!.text = faq.answer
//            return cell
          
            cell.textLabel!.text = searchQuestion[indexPath.row].question
            cell.detailTextLabel!.text = searchQuestion[indexPath.row].answer
            return cell
        }
    }

extension CityFAQViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchQuestion = faqArray.filter({ faq -> Bool in
            switch searchBar.selectedScopeButtonIndex{
            case 0:
                if searchText.isEmpty { return true }
            return faq.question.lowercased().contains(searchText.lowercased())
            
            default:
                return false
            }
            
        })
        tableCell.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            searchQuestion = faqArray
        default:
            break
        }
      tableCell.reloadData()
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


