//
//  CityVideoViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 10/03/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit
import AVKit

class CityVideoViewController: UIViewController {
    
    @IBAction func playVideoAction(_ sender: Any)
    {
        if let path = Bundle.main.path(forResource: "videoParis", ofType: "mp4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer,animated: true,completion: {
                video.play()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
