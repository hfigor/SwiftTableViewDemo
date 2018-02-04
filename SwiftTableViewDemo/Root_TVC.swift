//
//  Root_TVC.swift
//  SwiftTableViewDemo
//
//  Created by Frank Cipolla on 1/17/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class Root_TVC: UITableViewController, MenuItemSelectionDelegate {
    
    var orderList = OrderList()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { // pg 329
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  orderList.list.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // MARK: Alternate background colors pg 332
        if indexPath.row % 2 == 1 { // odd row
            cell.backgroundColor = UIColor(
                red: 0.8,
                green: 0.8,
                blue: 1.0,
                alpha: 1)
        } else {
            cell.backgroundColor = tableView.backgroundColor
        }
        
        // MARK: Set up icons
       cell.textLabel?.text = orderList.list[indexPath.row].menuItem
        let myString = String (format: "Item: %i", indexPath.row + 1)
        cell.detailTextLabel?.text = String (format: "Item: %i", indexPath.row + 1) // pg 332
        cell.imageView?.image = UIImage(named: "pizza bar icon")
        return cell
    }
   
    // MARK: Delegates
    
    func didSelectMenuItem(controller: UITableViewController, order: OrderModel) {
        orderList.addList(model: order)
        controller.navigationController?.popViewController(animated: true)
        tableView.reloadData()
    }
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

    
    // MARK: - Navigation 

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // pg 330
        // Pass the selected object to the new view controller.
        if segue.identifier == "OrderSegue"{
            let vc = segue.destination as! FullMenu_TVC
            vc.delegate = self
            
            let backItem = UIBarButtonItem() // from: https://stackoverflow.com/questions/28471164/how-to-set-back-button-text-in-swift
            backItem.title = "Order"
            navigationItem.backBarButtonItem = backItem
        }
    }
   

}
