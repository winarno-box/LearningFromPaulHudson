//
//  DetailViewController.swift
//  project1
//
//  Created by agus winarno on 8/15/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var numberOfSlectedImage: Int?
    var CountofImage: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set detail view name
        title = "\(numberOfSlectedImage!) of \(CountofImage!)"
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

}
