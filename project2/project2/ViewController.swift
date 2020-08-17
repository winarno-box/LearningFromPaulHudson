//
//  ViewController.swift
//  project2
//
//  Created by agus winarno on 8/16/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var maxToPlay = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // add country name
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // set border line
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // set border color
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        // call asquestion function
        askQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(score)", style: .plain, target: self, action: nil)
   
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        // suffle country array
        countries.shuffle()
        
        // set image to button from array 0 until 2
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // random correct answer
        correctAnswer = Int.random(in: 0...2)
        
        // set title page from random correct answer
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That’s the flag of \(countries[sender.tag])"
            score -= 1
        }
        
        
        maxToPlay += 1
        if maxToPlay < 4 {
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        //ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        // use closure
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
            self.askQuestion()
        }))
        
        present(ac, animated: true)
            
        }else{
            let ac = UIAlertController(title: "Finish", message: "Your Final Score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                
                self.title = ""
                self.maxToPlay = 0
                self.askQuestion()
                
            }))
            
            present(ac, animated: true)
            self.score = 0
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(score)", style: .plain, target: self, action: nil)
        
    }
    
}

