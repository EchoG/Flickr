//
//  PhotoDetailsViewController.swift
//  Trumblr
//
//  Created by Chenran Gong on 10/16/16.
//  Copyright © 2016 Chenran Gong. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var detailedTitleLabel: UILabel!
    @IBOutlet weak var detailedImage: UIImageView!
    
    @IBOutlet weak var detailedOverviewLabel: UILabel!
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let poster_path = movie["poster_path"] as? String{
            let image_url = URL(string: "https://image.tmdb.org/t/p/w92" + poster_path)!
            self.detailedImage.setImageWith(image_url)
        }
        if let title = movie["title"] as! String? {
            detailedTitleLabel.text = title
        }
        if let overview = movie["overview"] as! String? {
            detailedOverviewLabel.text = overview
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
