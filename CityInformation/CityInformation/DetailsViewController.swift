//
//  DetailsViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 18/02/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit
import AVKit


class DetailsViewController: UIViewController {

    var cityData :  City!
    public var savedCity : String!
    //var saveCityController = CitySaveTableViewController()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var playVideoButton: UIButton!
    @IBAction func moreInfoAction(_ sender: Any) {
    }
    
    @IBAction func playVideoAction(_ sender: Any) {
        var cityName = nameLabel.text
//        switch cityName {
//        case "City: Paris":
//            var videoName = "videoParis"
//            playVideo(videoName: videoName)
//        case "City: Barcelona":
//            var videoName = "videoBarcelona"
//            playVideo(videoName: videoName)
//        default:
//            break;
//        }
        let videoName = "videoParis"
        playVideo(videoName: videoName)
    }
    
    func playVideo (videoName: String){
        if let path = Bundle.main.path(forResource: videoName, ofType: "mp4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer,animated: true,completion: {
                video.play()
            })
        }
    }
    
    @IBOutlet weak var moreInfo: UIButton!
    
   // @IBOutlet weak var askQuestion: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detailed Information"
        titleLabel.text = "More About \(cityData.name)"
        nameLabel.text =  "City: \(cityData.name)"
        countryLabel.text = "Country: \(cityData.country)"
        languageLabel.text = "Language: \(cityData.language)"
        currencyLabel.text = "Currency: \(cityData.currency)"
        urlLabel.text = "Url: \(cityData.url)"
        moreInfo.layer.cornerRadius = 6
        playVideoButton.layer.cornerRadius = 6
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "webSegue"{
            let destination = segue.destination as! CityWebViewController
            destination.webData = self.cityData.url
        }
       
    }
    

}
