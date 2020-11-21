//
//  ListItemBuilder.swift
//  shopper
//
//  Created by Chuck Pilon on 1/1/20.
//  Copyright © 2020 Pilon Apps, Inc. All rights reserved.
//

import Foundation
import CoreData

class ListItemBuilder {
    
    var listItem: ListItem;
    
    init(context: NSManagedObjectContext) {
        self.listItem = ListItem(context: context)
    }
    
    init() {
        self.listItem = ListItem()
    }
    
    func item(item: Item) -> ListItemBuilder {
        listItem.item = item
        return self
    }
    
    func quantity(quantity: NSDecimalNumber) -> ListItemBuilder {
        listItem.quantity = quantity
        return self
    }
    
    func list(list: List) -> ListItemBuilder {
        listItem.list = list
        return self
    }
    
    func build() -> ListItem {
        return self.listItem
    }

}

