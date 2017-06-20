//
//  MyFavoritesTableViewController.swift
//  PlayGround
//
//  Created by Timothy Sirchuk on 5/16/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

class MyFavoritesTableViewController: UITableViewController, EditFavoritesDelegate, AddFavoriteDelegate {
    
    
    var arrayOfLanguages:[String?] = ["Swift", "C#", "Javascript", "Typescript"]
    var rowSelected: Int = 0;
    
    @IBOutlet weak var AddButton: UIBarButtonItem!
    
    @IBOutlet weak var EditButton: UIBarButtonItem!
    
    func updateRowData(stringToUpdate: String) {
        print("updateRowData in EditFavoritesViewController")
        print("stringToUpdate: \(stringToUpdate)");
        
        arrayOfLanguages[rowSelected] = stringToUpdate;
        self.tableView.reloadData();
    }
    
    func AddRowData(stringToUpdate: String) {
        
        arrayOfLanguages.append(stringToUpdate)
        self.tableView.reloadData();
    }
    
    
    @IBAction func EditButtonClicked(_ sender: Any) {
        
        if(tableView.isEditing)
        {
            
            //tableView.isEditing = false;
            EditButton.title = "Edit";
            
        }
            
        else
        {
            
            //self.tableView.isEditing = true;
            EditButton.title = "Cancel";
        }
        AddButton.isEnabled = tableView.isEditing;
        tableView.isEditing = !tableView.isEditing;
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (section == 0) {
            return arrayOfLanguages.count == 0 ? 1 : arrayOfLanguages.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0 && arrayOfLanguages.count > 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LangCellIdentifier", for: indexPath)
            
            
            cell.textLabel?.text = arrayOfLanguages[indexPath.row];
            cell.detailTextLabel?.text = "Row \(indexPath.row + 1)";
            
            return cell;
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoLanguagesCellIdentifier", for: indexPath)
            
            if(indexPath.section == 0) {
                cell.textLabel?.text = "I hate all languages";
            }
            return cell;
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
  
        print("didSelectRow");
        
        rowSelected = indexPath.row;
        
        if(indexPath.section == 0 && arrayOfLanguages.count == 0)
        {
            return;
        }
        
        self.performSegue(withIdentifier: "EditFavoritesSegue", sender: self);
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My favorite programming languages:"
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        if(indexPath.section == 0 && arrayOfLanguages.count == 0)
        {
            return false;
        }
        
        return true;
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if (indexPath.section == 0)
            {
                if (arrayOfLanguages.count > 0)
                {
                    arrayOfLanguages.remove(at: indexPath.row);
                }
            }
            
            
            self.tableView.reloadData();
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        print("prepare called");
        
        if (segue.identifier == "EditFavoritesSegue")
            {
        
        let EditFavoritesViewController = segue.destination as! EditFavoritesViewController;
                
        
        EditFavoritesViewController.delegate = self;
        
        EditFavoritesViewController.rowTitle = arrayOfLanguages[rowSelected];
                
        }
        
        else if (segue.identifier == "AddFavoritesSegue")
            {
                let AddFavoriteViewController = segue.destination as! AddFavoriteViewController;
            
                AddFavoriteViewController.delegate = self;
          
        }
    }
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

