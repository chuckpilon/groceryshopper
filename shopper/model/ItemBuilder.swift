//
//  ItemBuilder.swift
//  shopper
//
//  Created by Chuck Pilon on 1/1/20.
//  Copyright © 2020 Pilon Apps, Inc. All rights reserved.
//

import Foundation
import CoreData

class ItemBuilder {
    
    var item: Item;
    
    init(context: NSManagedObjectContext) {
        self.item = Item(context: context)
    }
    
    init() {
        self.item = Item()
    }
    
    func name(name: String) -> ItemBuilder {
        item.name = name
        return self
    }
    
    func sku(sku: String) -> ItemBuilder {
        item.sku = sku
        return self
    }
    
    func build() -> Item {
        return self.item
    }

}
