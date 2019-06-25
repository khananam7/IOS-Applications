//
//  CityAccomodationViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 06/03/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit
import WebKit

class CityAccomodationViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var accomodationView: WKWebView!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Accomodation Search"
        accomodationView.navigationDelegate = self 
        accomodationView.scrollView.isScrollEnabled = true
       loadAddress()
        // Do any additional setup after loading the view.
      //  ActivityIndicator.center = self.view.center
        ActivityIndicator.hidesWhenStopped = true
    }
    func loadAddress(){
        let requestUrl = URL(string: "https://www.booking.com")
        let request = URLRequest(url: requestUrl!)
        accomodationView.load(request)
    }
    func showActivityIndicator (show : Bool){
        if show {
            ActivityIndicator.startAnimating()
        }
        else{
            ActivityIndicator.stopAnimating()
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
