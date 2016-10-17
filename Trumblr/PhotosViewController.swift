//
//  ViewController.swift
//  Trumblr
//
//  Created by Chenran Gong on 10/15/16.
//  Copyright © 2016 Chenran Gong. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var allMovies: [Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.rowHeight = 320
        getData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.codepath.PrototypeCell", for: indexPath as IndexPath) as! PrototypeCell
        
        let movie = self.allMovies?[indexPath.row] as! [String: Any]
        if let photos = movie["poster_path"] as? String{
            let photos_url = URL(string: "https://image.tmdb.org/t/p/w342" + photos)
            print(photos_url)
            cell.myImage.setImageWith(photos_url!)
            
        }
        if let title = movie["title"] as? String{
            cell.titleLabel.text = title
        }
        if let overview = movie["overview"] as? String{
            cell.overviewLabel.text = overview
        }
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _ = self.allMovies
        if let posts = self.allMovies {
            print("COUNT !!!! \(posts.count)")
            return posts.count
        }else{
            return 0
        }

    }
    
    func getData(){
        //let apiKey = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                
                if let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] {
                    if let results = json["results"] as? [Any]{
                        self.allMovies = results
                        self.tableView.reloadData()
                    }
                    
                    //print(self.allMovies)
                }
                
            }
        });
        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! PhotoDetailsViewController
        var indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        var movie = allMovies?[(indexPath?.row)!]
        print(movie)
        vc.movie = movie as! NSDictionary!
    }

}

