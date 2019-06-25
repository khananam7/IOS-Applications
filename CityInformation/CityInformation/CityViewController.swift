//
//  CityViewController.swift
//  CityInformation
//
//  Created by Anam Khan on 18/02/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    var cityData : City!
    var imageArray = [UIImage]()
    @IBOutlet weak var cityLabel: UILabel!
    //@IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBAction func moreInfoAction(_ sender: Any) {
    }
    
    @IBOutlet weak var moreInfo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "City Information"
        // Do any additional setup after loading the view.
        moreInfo.layer.cornerRadius = 6
        cityLabel.text = cityData.name
        //cityImage.image = UIImage(named: cityData.image)
        let image1 = UIImage(named: cityData.image2)
        let image2 = UIImage(named: cityData.image)
        let image3 = UIImage(named: cityData.image3)
        imageArray = [image1,image2,image3] as! [UIImage]
        //iterate through all iamges
        for i in 0..<imageArray.count{
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPos = self.mainScrollView.frame.width * CGFloat(i)
            let yPos = self.mainScrollView.frame.height * CGFloat(i)
            // y = 0 -> top left corner
            //xPos -> decide image left or right
            imageView.frame = CGRect(x: xPos, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat( i + 1)
            mainScrollView.addSubview(imageView)
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! DetailsViewController
        destination.cityData = self.cityData
    }
    
  

}
