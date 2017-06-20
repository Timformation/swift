//
//  EditFavoritesViewController.swift
//  PlayGround
//
//  Created by Timothy Sirchuk on 5/17/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

protocol EditFavoritesDelegate  {
    func updateRowData(stringToUpdate: String);
}

class EditFavoritesViewController: UIViewController {
    

    var delegate: EditFavoritesDelegate?;
    var rowTitle: String?;
    
    @IBOutlet weak var RowTextField: UITextField!
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func UpdateButtonClicked(_ sender: Any) {
        if (RowTextField.text != "") {
        print("update button clicked");
        self.delegate?.updateRowData(stringToUpdate: RowTextField.text!);
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        }
        else
        {
            let alertController = UIAlertController(title: "Alert!", message: "Please don't leave this field blank.", preferredStyle: UIAlertControllerStyle.alert); alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RowTextField.text = rowTitle;

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
