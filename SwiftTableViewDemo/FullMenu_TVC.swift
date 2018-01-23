//
//  FullMenu_TVC.swift
//  SwiftTableViewDemo
//
//  Created by Frank Cipolla on 1/17/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class FullMenu_TVC: UITableViewController, MenuItemSelectionDelegate { // Static Tables
    
    var delegate:MenuItemSelectionDelegate! = nil
    
    var myOrder = OrderModel()
    
    let dessertSection = 1  // we can do this with enum
    let iceCreamRow = 1
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == dessertSection {  // Are we in the dessert section?
            if indexPath.row == iceCreamRow {
                performSegue(withIdentifier: "IceCreamSegue", sender: self)
            } else {
                performSegue(withIdentifier: "PieSegue", sender: self)
            }
        }
    }
    
    func didSelectMenuItem(controller: UITableViewController, order: OrderModel) {
        myOrder = order
        navigationItem.title = order.menuItem
        
        controller.navigationController?.popViewController(animated: true)
    }
  
    // MARK: Actions
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        delegate.didSelectMenuItem(controller: self,order: myOrder)
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        enum sections: Int { // from pg 326
            case Pizza = 0, DeepDish, Calzone
        }
        
        if segue.identifier == "PizzaSegue" {
            let vc = segue.destination as! PizzaMenu_TVC
            vc.delegate = self
            vc.gotoSection = sections.Pizza.rawValue
        }
        
        if segue.identifier == "DeepDishSegue" {
            let vc = segue.destination as! PizzaMenu_TVC
            vc.delegate = self
            vc.gotoSection = sections.DeepDish.rawValue
        }
        
        if segue.identifier == "CalzoneSegue" {
            let vc = segue.destination as! PizzaMenu_TVC
            vc.delegate = self
            vc.gotoSection = sections.Calzone.rawValue
        }
        
        /*   switch segue.identifier { // this will not work bc string equality utilizes grapheme comparison with == operator
         case "PizzaSegue", "DeepDishSegue", "CalzoneSegue" :
         let vc = segue.destination as! PizzaMenu_TVC
         vc.delegate = self
         default:
         print("hit default: FullMenu_TVC : prepareForSegue")
         let vc = segue.destination as! PizzaMenu_TVC
         vc.delegate = self
         }
         */
        
    }
}
