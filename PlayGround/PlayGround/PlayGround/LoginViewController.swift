//
//  LoginViewController.swift
//  PlayGround
//
//  Created by TIMOTHY G SIRCHUK on 4/27/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func LoginButtonClicked(_ sender: AnyObject) {
        
        if (userNameTextField.text?.characters.count == 0) {
            //print("display error message");
            
            let alertController = UIAlertController(title: "Invalid Input", message: "Please enter a valid username.", preferredStyle: .alert);
            
            /*let okayAction = UIAlertAction(title: OK, style: default, handler: nil);
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil,));
 */
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));            self.present(alertController, animated: true, completion: nil);
            
            return;
            
        }
        
        self.performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
