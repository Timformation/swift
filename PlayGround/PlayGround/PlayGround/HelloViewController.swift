//
//  HelloViewController.swift
//  PlayGround
//
//  Created by TIMOTHY G SIRCHUK on 4/11/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    //IB = interface builder (outlet)
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var HelloLabel: UILabel!
    @IBAction func displayButtonClicked(_ sender: Any) {
        
        let age:Int = 15;
        
        
        if let name = nameTextField.text
        {
        HelloLabel.text = "Hello \(name) Age:\(age)";
        }
        
        
        print ("displayButtonClick Called")
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
