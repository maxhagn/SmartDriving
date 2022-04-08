//
//  SecondViewController.swift
//  smartdriving
//
//  Created by Maximilian Hagn on 02.09.18.
//  Copyright © 2018 Maximilian Hagn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    //declaring vars
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Close Keyboard by clicking out of Textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Actions executed by memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

