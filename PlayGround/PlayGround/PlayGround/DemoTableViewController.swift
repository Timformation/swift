//
//  DemoTableViewController.swift
//  PlayGround
//
//  Created by TIMOTHY G SIRCHUK on 5/8/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController, DemoTableRowDelegate {
    
    var arrayOfStrings:[String] = ["A", "B", "Z"];
    var arrayOfNumbers:[Int] = []
    var rowSelected: Int = 0;
    
    @IBOutlet weak var addButton: UIBarButtonItem!

    @IBOutlet weak var editButton: UIBarButtonItem!
    
    func updateRowData(stringToUpdate: String) {
        print("updateRowData in DemoTableViewController called");
        print("stringToUpdate: \(stringToUpdate)");
        
        arrayOfStrings[rowSelected] = stringToUpdate;
        
        self.tableView.reloadData();
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
    
        print("Add Button Clicked");
        
        arrayOfNumbers.append(arrayOfNumbers.count + 1);
        self.tableView.reloadData();
    }
    @IBAction func editButtonClicked(_ sender: Any) {
        
        if(tableView.isEditing)
        {
            
            //tableView.isEditing = false;
            editButton.title = "Edit";
            
        }
        
        else
        {
            
            //self.tableView.isEditing = true;
            self.editButton.title = "Cancel";
        }
        addButton.isEnabled = tableView.isEditing;
        tableView.isEditing = !tableView.isEditing;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return arrayOfStrings.count == 0 ? 1 : arrayOfStrings.count;
        if(section == 0) {
            return arrayOfStrings.count == 0 ? 1 : arrayOfStrings.count;
        }
        else {
            return arrayOfNumbers.count == 0 ? 1 : arrayOfNumbers.count;
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0 && arrayOfStrings.count > 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StringDemoCellIndentifier", for: indexPath)
            
            
            // Configure the cell...
            
            /*
             
             if(indexPath.section == 0)
             {
             if(indexPath.row == 0) {
             cell.textLabel?.text = "ABC-0";
             }
             else
             {
             cell.textLabel?.text = "ABC";
             }
             }
             else
             {
             cell.textLabel?.text = "XYZ";
             }
             */
            
            /*
             cell.textLabel?.text = "Section #\(indexPath.section) Row #\(indexPath.row)";
             */
            cell.textLabel?.text = arrayOfStrings[indexPath.row];
            cell.detailTextLabel?.text = "Row \(indexPath.row + 1)";
            
            return cell
        }
        else if(indexPath.section == 1 && arrayOfNumbers.count > 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NumberDemoCellIndentifier", for: indexPath)
            
            //cell.textLabel?.text = arrayOfStrings[indexPath.row];
            cell.detailTextLabel?.text = String(arrayOfNumbers[indexPath.row]);
            
            return cell
        }

        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoRowFoundCellIndentifier", for: indexPath)
            
            if(indexPath.section == 0) {
                cell.textLabel?.text = "No Strings Found";
            }
            else {
                cell.textLabel?.text = "No Numbers Found";
            }
            
            return cell;
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        
        
        //print("didSelectRow");
        
        rowSelected = indexPath.row;
        
        if(indexPath.section == 0 && arrayOfStrings.count == 0)
        {
            return;
        }
        
        if(indexPath.section == 1 && arrayOfNumbers.count == 0)
        {
            return;
        }

        
        
        self.performSegue(withIdentifier: "TableSegue", sender: self);
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Array Of Strings" : "Array Of Numbers";
    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        if(indexPath.section == 0 && arrayOfStrings.count == 0)
        {
        return false;
        }
        return true;
    }
    
    
    
     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if (indexPath.section == 0)
            {
                if (arrayOfStrings.count > 0)
                {
                    arrayOfStrings.remove(at: indexPath.row);
            }
        }
            else if(indexPath.section == 1)
            {
                arrayOfNumbers.remove(at: indexPath.row);
            }
            
            self.tableView.reloadData();
            
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }     }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        print("prepare called");
        
        
        
        let DemoTableRowViewController = segue.destination as! DemoTableRowViewController;
        
        DemoTableRowViewController.delegate = self;
        
        DemoTableRowViewController.rowTitle = arrayOfStrings[rowSelected];
    }
    
    
    
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
    
    
    
    
}
