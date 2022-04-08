//
//  ViewController.swift
//  
//
//  Created by Maximilian Hagn on 02.09.18.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase


class ViewController: UIViewController, UITextFieldDelegate {

    //declaring vars
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passwd: UITextField!
    var ref: DatabaseReference!
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.email.delegate = self
        self.passwd.delegate = self
    }
    
    //Actions executed when view appear
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.firstUsed()
        }
    }
    
    //Actions executed by memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Keyboard should return to next Textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         self.login()
         return true
    }
    
    
    //Close Keyboard by clicking out of Textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //check if user already added their data
    func firstUsed(){
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
        ref.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.hasChild(uid){
                    self.presentLoggedInPage()
                }else{
                    self.presentIntro()
                }
            })
    }
    }
    
    //show main app screen when logged in
    func presentLoggedInPage(){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let uITabBarController:UITabBarController = storyboard.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
        self.present(uITabBarController, animated: true, completion: nil)
    }
    
    //show intro screen when first log in
    func presentIntro(){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController:IntroViewController = storyboard.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    //Action when login tabbed
    @IBAction func loginTabbed(_ sender: Any) {
        self.login()
    }
    
    //Login Function
    func login(){
        if let email = email.text, let password = passwd.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { user, error in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.firstUsed()
            })
        }
    }
    
    //Register with Firebase Func
    @IBAction func createAccount(_ sender: Any) {
        if let email = email.text, let password = passwd.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.firstUsed()
            })
        }
    }
}
