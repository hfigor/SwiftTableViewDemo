//
//  OrderList.swift
//  SwiftTableViewDemo
//
//  Created by Frank Cipolla on 1/23/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class OrderList: NSObject { // pg 328
    var list: [OrderModel] = []
    
    func addList(model: OrderModel){
        list = list + [model]
    }
    
}
