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

    var ref: DatabaseReference!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var carId: UITextField!
    @IBOutlet weak var startDistance: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.name.delegate = self
        self.lastName.delegate = self
        self.carId.delegate = self
        self.startDistance.delegate = self
    }
    
    //Close Keyboard by clicking out of Textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Upload the Intro Data
    @IBAction func uploadData(_ sender: Any) {
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let data = [
                "name":  name.text,
                "lastName": lastName.text,
            ]
            let firstCar = [
                "carId":   carId.text,
                "startDistance": startDistance.text
            ]
            ref.child("Users").child(uid).child("UserData").setValue(data)
            ref.child("Users").child(uid).child("Cars").childByAutoId().setValue(firstCar)
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let uITabBarController:UITabBarController = storyboard.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            self.present(uITabBarController, animated: true, completion: nil)
        }
    }
}
