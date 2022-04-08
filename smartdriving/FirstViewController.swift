//
//  FirstViewController.swift
//  smartdriving
//
//  Created by Maximilian Hagn on 02.09.18.
//  Copyright © 2018 Maximilian Hagn. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    //declaring vars
    @IBOutlet weak var distance: UILabel!
    var dataFin: [Int : [String : String]]!
    var ref: DatabaseReference!
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
       // self.loadData()
    }
    
    //Actions executed by memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Load the Data from current User

}

