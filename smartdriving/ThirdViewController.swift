//
//  ThirdViewController.swift
//  
//
//  Created by Maximilian Hagn on 04.09.18.
//

import UIKit
import FirebaseAuth

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
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
    }
    
    //Action when new Car Button is tabbed
    @IBAction func addCar(_ sender: Any) {
       self.presentAddCar()
    }
    
    //Add Car Window appears function
    func presentAddCar(){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController:CarViewController = storyboard.instantiateViewController(withIdentifier: "CarViewController") as! CarViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    //Logout Function
    @IBAction func logOut(_ sender: Any) {
        do {
         try Auth.auth().signOut()
         dismiss(animated: true, completion: nil)
            
        } catch {print("Problem logging you out!")}
    }
}
