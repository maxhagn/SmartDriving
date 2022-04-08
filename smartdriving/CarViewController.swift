//
//  CarViewController.swift
//  smartdriving
//
//  Created by Maximilian Hagn on 07.09.18.
//  Copyright © 2018 Maximilian Hagn. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CarViewController: UIViewController, UITextFieldDelegate {
    
    //declaring vars
    var ref: DatabaseReference!
    @IBOutlet weak var carId: UITextField!
    @IBOutlet weak var startDistance: UITextField!
    @IBOutlet weak var maxPrivat: UITextField!
    @IBOutlet weak var maxBusiness: UITextField!
    
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.carId.delegate = self
        self.startDistance.delegate = self
        self.maxPrivat.delegate = self
        self.maxBusiness.delegate = self
    }
    
    //Close Keyboard by clicking out of Textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //Actions executed by memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Cancel add new car
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Add a new car to database
    @IBAction func addCar(_ sender: Any) {
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let newCar = [
                "carId":   carId.text,
                "startDistance": startDistance.text,
                "maxPrivat": maxPrivat.text,
                "maxBusiness": maxBusiness.text
            ]
            ref.child("Users").child(uid).child("Cars").childByAutoId().setValue(newCar)
            dismiss(animated: true, completion: nil)
        }
    }
}
