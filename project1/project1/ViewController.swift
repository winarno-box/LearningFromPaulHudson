//
//  ViewController.swift
//  project1
//
//  Created by agus winarno on 8/15/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //varible untuk menyimpan gambar dari item
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Strom Viewer"
        
        // set large  title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                
                // this is a picture to load!
                pictures.append(item)
                pictures.sort()
            }
        }
        
        // cek print picture
        print(pictures)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // return picture count to the row
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // define cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        // set picture name to label of cell
        cell.textLabel?.text = pictures[indexPath.row]
        
        // return cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            vc.numberOfSlectedImage = indexPath.row + 1
            vc.CountofImage = pictures.count
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

