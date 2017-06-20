//
//  AddTutorialViewController.swift
//  Final Project
//
//  Created by Timothy Sirchuk on 6/9/17.
//  Copyright © 2017 Timothy Sirchuk. All rights reserved.
//

import UIKit

protocol AddTutorialDelegate  {
    func AddRowData(stringToAdd: String, URLtoAdd: String);

}

class AddTutorialViewController: UITableViewController {
    
    var delegate: AddTutorialDelegate?;
    
    var Name: String?;
    var URL: String?;

    @IBOutlet weak var URLTextField: UITextField!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var CancelButton: UIButton!
    
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var AddButton: UIButton!
    
    @IBAction func AddButtonClicked(_ sender: Any) {
        if (NameTextField.text == "") {
            let alertController = UIAlertController(title: "Need additional input:", message: "Please enter a tutorial name", preferredStyle: .alert);
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            
            self.present(alertController, animated: true, completion: nil);
            return;
            
        }
            
        else if (URLTextField.text == "") {
            
            let alertController = UIAlertController(title: "Need additional input:", message: "Please enter a valid URL", preferredStyle: .alert);
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            
            self.present(alertController, animated: true, completion: nil);
            return;
        }
            
        else {
            self.delegate?.AddRowData(stringToAdd: NameTextField.text!, URLtoAdd: URLTextField.text!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        URLTextField.text = URL;
        NameTextField.text = Name;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
