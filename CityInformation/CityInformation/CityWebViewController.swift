//
//  CityWebViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 18/02/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit
import WebKit

class CityWebViewController: UIViewController,WKNavigationDelegate {
    let blockRules = """
         [{"action":{"type":"block"},"trigger":{"url-filter":".*","resource-type":["image"]}},{"action":{"type": "block"},"trigger":{"url-filter":".*","resource-type":["style-sheet"]}}]
      """
    
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cityWebView: WKWebView!
    @IBOutlet weak var webLabel: UITextField!
    var webData : String!
    @IBAction func goAction(_ sender: Any) {
        self.cityWebView.configuration.userContentController.removeAllContentRuleLists()
        cityWebView.navigationDelegate = self
        let url = URL(string: webLabel.text!)
        let request = URLRequest(url: url!)
        cityWebView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wikipedia Information"
        cityWebView.navigationDelegate = self
        cityWebView.scrollView.isScrollEnabled = true
        webLabel.text = webData
        let url = URL(string: webData)
        let request = URLRequest(url: url!)
        cityWebView.load(request)
    }
    
    func showActivityIndicator (show : Bool){
        if show {
            ActivityIndicator.startAnimating()
        }
        else{
            ActivityIndicator.stopAnimating()
            ActivityIndicator.hidesWhenStopped = true
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
    
    @IBAction func loadBasicAction(_ sender: Any) {
        let loadrequest = URLRequest(url: URL(string: webLabel.text!)!)
        WKContentRuleListStore.default().compileContentRuleList(
            forIdentifier: "ContentBlockingRules",
            encodedContentRuleList: blockRules)
        { (contentRuleList, error) in
                if let error = error {
                    return
                }
            let configuration = self.cityWebView.configuration
                configuration.userContentController.add(contentRuleList!)
                self.cityWebView.load(loadrequest)
        }

    }
}
