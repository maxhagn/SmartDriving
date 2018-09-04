//
//  ThirdViewController.swift
//  
//
//  Created by Maximilian Hagn on 04.09.18.
//

import UIKit
import FirebaseAuth

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        do {
         try Auth.auth().signOut()
         dismiss(animated: true, completion: nil)
            
        } catch {print("Problem logging you out!")}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
