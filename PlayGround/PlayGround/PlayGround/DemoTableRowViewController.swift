//
//  DemoTableRowViewController.swift
//  PlayGround
//
//  Created by Timothy Sirchuk on 5/15/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

protocol DemoTableRowDelegate  {
    func updateRowData (stringToUpdate: String);
}

class DemoTableRowViewController: UIViewController {
    
    var delegate: DemoTableRowDelegate?;
    
    var rowTitle: String?
    
    @IBOutlet weak var RowTextField: UITextField!
    
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        print("Cancel button clicked.");
        //TODO: Figure out how to go back programmatically..........................
    }

    
    @IBAction func UpdateButtonClicked(_ sender: Any) {
        print("Update button clicked");
        
        self.delegate?.updateRowData(stringToUpdate: RowTextField.text!);
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //print("DemoTableRowViewController viewDidLoad called");
        //print("rowTitle: \(rowTitle!)");
        
        RowTextField.text = rowTitle;
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
