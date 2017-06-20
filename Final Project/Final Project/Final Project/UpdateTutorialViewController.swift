//
//  UpdateTutorialViewController.swift
//  Final Project
//
//  Created by Timothy Sirchuk on 6/10/17.
//  Copyright © 2017 Timothy Sirchuk. All rights reserved.
//

import UIKit

protocol UpdateTutorialDelegate {
    func updateRowData(stringToUpdate: String, urlToUpdate: String);
}


class UpdateTutorialViewController: UITableViewController {
    
    var delegate: UpdateTutorialDelegate?;
    var updatedTutorial: String?;
    var updatedURL: String?;
    
    @IBOutlet weak var UpdateNameTextField: UITextField!
    
    @IBOutlet weak var UpdateURLTextField: UITextField!
    
    @IBOutlet weak var UpdateButton: UIButton!
    
    @IBAction func UpdateButtonClicked(_ sender: Any) {
        if (UpdateNameTextField.text == "") {
            let alertController = UIAlertController(title: "Need additional input:", message: "Please enter a name.", preferredStyle: .alert);
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            
            self.present(alertController, animated: true, completion: nil);
            return;
            
        }
            
        else if (UpdateURLTextField.text == "") {
            
            let alertController = UIAlertController(title: "Need additional input:", message: "Please enter a URL.", preferredStyle: .alert);
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            
            self.present(alertController, animated: true, completion: nil);
            return;
        }
            
        else {
            self.delegate?.updateRowData(stringToUpdate: UpdateNameTextField.text!, urlToUpdate: UpdateURLTextField.text!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var CancelButton: UIButton!
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UpdateNameTextField.text = updatedTutorial;
        UpdateURLTextField.text = updatedURL;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
