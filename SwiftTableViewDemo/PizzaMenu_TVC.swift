//
//  PizzaMenu_TVC.swift
//  SwiftTableViewDemo
//
//  Created by Frank Cipolla on 1/19/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class PizzaMenu_TVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var myOrder = OrderModel()
    var menuItems = PizzaMenuItems()
    
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
}
