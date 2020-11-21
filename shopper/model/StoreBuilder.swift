//
//  StoreBuilder.swift
//  shopper
//
//  Created by Chuck Pilon on 12/31/19.
//  Copyright © 2019 Pilon Apps, Inc. All rights reserved.
//

import Foundation
import CoreData

class StoreBuilder {
    
    var store: Store;
    
    init(context: NSManagedObjectContext) {
        self.store = Store(context: context)
    }
    
    init() {
        self.store = Store()
    }
    
    func name(name: String) -> StoreBuilder {
        store.name = name
        return self
    }
    
    func address1(address1: String) -> StoreBuilder {
        store.address1 = address1
        return self
    }
    
    func address2(address2: String) -> StoreBuilder {
        store.address2 = address2
        return self
    }

    func city(city: String) -> StoreBuilder {
        store.city = city
        return self
    }

    func state(state: String) -> StoreBuilder {
        store.state = state
        return self
    }

    func zip(zip: String) -> StoreBuilder {
        store.zip = zip
        return self
    }

    func latitude(latitude: NSDecimalNumber) -> StoreBuilder {
        store.latitude = latitude
        return self
    }

    func longitude(longitude: NSDecimalNumber) -> StoreBuilder {
        store.longitude = longitude
        return self
    }

    func build() -> Store {
        return self.store
    }


}
