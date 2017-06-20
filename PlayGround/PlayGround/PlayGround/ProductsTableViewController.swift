//
//  ProductsTableViewController.swift
//  PlayGround
//
//  Created by Timothy Sirchuk on 5/8/17.
//  Copyright © 2017 TIMOTHY SIRCHUK. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        
        product2.name = "1292 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"

        
        
        products = [product1, product2, product3, product4]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let pName = products {
            return pName.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell",
        for: indexPath)
        
        let product = products?[indexPath.row]
        
       
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
            cell.imageView?.image = UIImage(named: i)
            }
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destination as? ProductViewController
            
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else {
              return
            }
            productVC?.product = products?[indexPath.row]
            
            
            //let cell = sender as? UITableViewCell       ##### THE CODE BELOW IS THE SAME AS THE CODE ABOVE (condensed).
            //if let c = cell {
                //let indexPath = tableView.indexPath(for: c)
                //if let ip = indexPath {
                    //let productName = productNames?[ip.row]
                    //productVC?.productName = productName
                }
            }
            
            //productVC?.productName = "Really old phone"
            
            // get the cell that was tapped
            // get the index path for that cell
            // use the index path to get the productName from the array
            //send the product name to the product view controller
            
    
        }



