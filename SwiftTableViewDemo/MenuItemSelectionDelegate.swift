//
//  MenuItemSelectionDelegate.swift
//  SwiftTableViewDemo
//
//  Created by Frank Cipolla on 1/23/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

protocol MenuItemSelectionDelegate { // generic protocol to pass the view controller and model back to calling controller
    func didSelectMenuItem(
        controller: UITableViewController,
        order:OrderModel)
}
