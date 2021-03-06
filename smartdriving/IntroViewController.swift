//
//  IntroViewController.swift
//  smartdriving
//
//  Created by Maximilian Hagn on 04.09.18.
//  Copyright © 2018 Maximilian Hagn. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class IntroViewController: UIViewController, UITextFieldDelegate {

    //declaring vars
    var ref: DatabaseReference!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var carId: UITextField!
    @IBOutlet weak var startDistance: UITextField!
    @IBOutlet weak var maxPrivat: UITextField!
    @IBOutlet weak var maxBusiness: UITextField!
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.name.delegate = self
        self.lastName.delegate = self
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
    
    //Upload the Intro Data
    @IBAction func uploadData(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let data = [
                "name":  name.text,
                "lastName": lastName.text,
            ]
            let firstCar = [
                "carId":   carId.text,
                "startDistance": startDistance.text,
                "maxPrivat": maxPrivat.text,
                "maxBusiness": maxBusiness.text
            ]
            ref.child("Users").child(uid).child("UserData").setValue(data)
            ref.child("Users").child(uid).child("Cars").childByAutoId().setValue(firstCar)
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let uITabBarController:UITabBarController = storyboard.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            self.present(uITabBarController, animated: true, completion: nil)
        }
    }
}
