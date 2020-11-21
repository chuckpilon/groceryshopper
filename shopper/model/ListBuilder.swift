//
//  ListBuilder.swift
//  shopper
//
//  Created by Chuck Pilon on 1/1/20.
//  Copyright © 2020 Pilon Apps, Inc. All rights reserved.
//

import Foundation
import CoreData

class ListBuilder {

    var list: List;

    init(context: NSManagedObjectContext) {
        self.list = List(context: context)
    }

    init() {
        self.list = List()
    }

    func name(name: String) -> ListBuilder {
        list.name = name
        return self
    }

    func open(open: Bool) -> ListBuilder {
        list.open = open
        return self
    }

    func store(store: Store) -> ListBuilder {
        list.store = store
        return self
    }

    func build() -> List {
        self.list.created = Date()
        return self.list
    }

}
