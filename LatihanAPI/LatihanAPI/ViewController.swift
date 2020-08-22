//
//  ViewController.swift
//  LatihanAPI
//
//  Created by agus winarno on 8/20/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&from=2020-07-21&sortBy=publishedAt&apiKey=24e8b85592644c43a91b12d72ad376f6"
        let url = URL(string: urlString)
        
        // check if url not nill
        guard url != nil else {
            return
        }
        
        // set url session
        let session = URLSession.shared
        
        // set dataTask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check for errors
            if error == nil && data != nil {
                
                //Parse JSON
                let decoder = JSONDecoder()
                
                do{
                    
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    
                    print(newsFeed)
                    
                }catch{
                    
                    // print error
                    print("\(error) in JSON parse")
                }
            }
        
        }
        
        
        // make API call
        dataTask.resume()
        
    }


}

