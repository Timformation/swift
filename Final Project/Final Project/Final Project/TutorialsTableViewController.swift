//
//  TutorialsTableViewController.swift
//  Final Project
//
//  Created by Timothy Sirchuk on 6/9/17.
//  Copyright © 2017 Timothy Sirchuk. All rights reserved.
//

import UIKit

class TutorialsTableViewController: UITableViewController, AddTutorialDelegate, UpdateTutorialDelegate {
    
    var arrayOfTutorials:[String?] = []
    var arrayOfURLs:[String?] = []
    var rowSelected: Int = 0;
    var informationIcon: Int = 0;
    

    @IBOutlet weak var EditButton: UIBarButtonItem!
    
    @IBOutlet weak var AddButton: UIBarButtonItem!
    
    @IBAction func EditButtonClicked(_ sender: Any) {
        
        if(tableView.isEditing)
        {
            
            
            EditButton.title = "Edit";
            
        }
            
        else
        {
            
           
            EditButton.title = "Cancel";
        }
        AddButton.isEnabled = tableView.isEditing;
        tableView.isEditing = !tableView.isEditing;
        
    
    }
    
    @IBAction func AddButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "AddTutorialSegue", sender: self)
    }
    func AddRowData(stringToAdd: String,  URLtoAdd: String) {
        
        
        arrayOfTutorials.append(stringToAdd);
        arrayOfURLs.append(URLtoAdd);

        self.tableView.reloadData();
    }

    func updateRowData(stringToUpdate: String, urlToUpdate: String) {
        arrayOfTutorials[informationIcon] = stringToUpdate;
        
        arrayOfURLs[informationIcon] = urlToUpdate;
        
        self.tableView.reloadData();
        EditButton.isEnabled = true;
        
        
        _ = navigationController?.popViewController(animated: true);
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return arrayOfTutorials.count == 0 ? 1 : arrayOfTutorials.count
        }
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0 && arrayOfTutorials.count > 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Tutorials", for: indexPath)
            
            
            cell.textLabel?.text = arrayOfTutorials[indexPath.row];
            cell.detailTextLabel?.text = arrayOfURLs[indexPath.row];
            EditButton.isEnabled = true;
            
            
            return cell;
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoTutorials", for: indexPath)
            
            if(indexPath.section == 0) {
                cell.textLabel?.text = "No Tutorials Found";
                EditButton.isEnabled = false;
                AddButton.isEnabled = true;
                tableView.isEditing = false;
                EditButton.title = "Edit"
            }
            return cell;
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        rowSelected = indexPath.row;
        if (arrayOfURLs.count == 0 || arrayOfTutorials.count == 0 ) {
            return;
        }
        else {
            self.performSegue(withIdentifier: "WebViewSegue", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if(indexPath.section == 0 && arrayOfTutorials.count == 0)
        {
            return false;
        }
        
        return true;
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if (indexPath.section == 0)
            {
                if (arrayOfTutorials.count > 0)
                {
                    arrayOfTutorials.remove(at: indexPath.row);
                }
            }
            
            self.tableView.reloadData();
        }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        informationIcon = indexPath.row;
        
        if (indexPath.section == 0 && arrayOfTutorials.count == 0 && arrayOfURLs.count == 0) {
            return;
        }
        
        self.performSegue(withIdentifier: "UpdateTutorialSegue", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AddTutorialSegue"){
            let nav = segue.destination as! UINavigationController
            let add = nav.topViewController as! AddTutorialViewController
            add.delegate = self;
        }
            
            else if (segue.identifier == "UpdateTutorialSegue") {
                let nav = segue.destination as! UINavigationController
                let update = nav.topViewController as! UpdateTutorialViewController;
                update.delegate = self;
                update.updatedTutorial = arrayOfTutorials[informationIcon];
                update.updatedURL = arrayOfURLs[informationIcon];
                
            }

            
        else if segue.identifier == "WebViewSegue" {
            
            let nav = segue.destination as! WebViewViewController;
            nav.Name = arrayOfTutorials[rowSelected];
            nav.webSite = arrayOfURLs[rowSelected];
        }
 
       }
}
