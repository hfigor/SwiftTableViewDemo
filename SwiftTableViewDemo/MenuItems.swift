//
//  MenuItems.swift
//  SwiftTableViewDemo
//
//  Created by Frank Cipolla on 1/19/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class MenuItems: NSObject {
    var sections:[String] = []
    var items:[[String]] = []
    
    func addSection(section: String, item:[String]) {
        sections = sections + [section]
        items = items + [item]
    }
}

class PizzaMenuItems: MenuItems {
    override init() {
        super.init()
        addSection(section: "Pizza",
                   item: [
                        "Margherita","BBQ Chicken",
                        "Pepperoni","Sausage","Seafood",
                        "Special"])
        addSection(section: "Deep Dish Pizza",
                   item: [
                        "Sausage","Meat Lover's",
                        "Veggie :over's","BBQ Chicken",
                        "Mushroom","Special"])
        addSection(section: "Calzone",
                   item: [
                        "Sausage","Chicken Pesto",
                        "Prawns and Mushrooms","Primavera",
                        "Meatball"])
    }
}
