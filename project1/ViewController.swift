//
//  ViewController.swift
//  project1
//
//  Created by agus winarno on 8/15/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //varible untuk menyimpan gambar dari item
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
            }
        }
    }


}

