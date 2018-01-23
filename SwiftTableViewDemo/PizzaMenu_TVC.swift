//
//  PizzaMenu_TVC.swift
//  SwiftTableViewDemo
//
//  Created by Frank Cipolla on 1/19/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class PizzaMenu_TVC: UITableViewController { // Dynamic Tables require data sources and delegates
    
    var delegate:MenuItemSelectionDelegate! = nil
    var myOrder = OrderModel()
    var menuItems = PizzaMenuItems()
    var gotoSection: Int = 0 // pg 327
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewDidAppear(_ animated: Bool) { // pg 327
        super.viewDidAppear(animated)
        let indexPath = IndexPath(item: 0, section: gotoSection)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
        
    }
    // MARK: Set Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return menuItems.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.items[section].count
    }
    
    // MARK: Configure Cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        let row = indexPath.row
        let section = indexPath.section
        let menuItem = menuItems.items[section][row]
        cell.textLabel?.text = menuItem
        return cell
    }
    
    // MARK: Headers
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuItems.sections[section]
    }
    
    // MARK: Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row // create constant
        let section = indexPath.section // create constant
        let order =
            menuItems.items[section][row] + "" +
            menuItems.sections[section] //4
        navigationItem.title = order
        // set the model and call the protocol
        myOrder.menuItem = order
        delegate.didSelectMenuItem(controller: self, order: myOrder)
        // We get the title poulated and the selected item is highlighted
        tableView.deselectRow(at: indexPath, animated: true) // now we get title and row flashes but does not stay highlighted.
    }
    
    
}
