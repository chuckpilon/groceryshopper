//
//  AppDelegate.swift
//  shopper
//
//  Created by Chuck Pilon on 12/14/19.
//  Copyright © 2019 Pilon Apps, Inc. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // NOTE: Test data. Remove this.
        // insertTestData()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {

        // NOTE: Test data. Remove this.
        // deleteTestData()

    }
    
    func deleteTestData() -> Void {
        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Store")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context!.execute(deleteRequest)
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func insertTestData() -> Void {
        
        let cheezit = insertItem(name: "Cheez-It Baked Snack Cheese Crackers Original", sku: "799589023")
        let pudding = insertItem(name: "Snack Pack Pudding Sugar Free Chocolate", sku: "799596205")
        
        let jerrys = insertStore(name: "Jerry's Foods", address1: "7760 Hargis Pkwy", address2: "", city: "Woodbury", state: "MN", zip: "55125", latitude: 44.888166, longitude: -92.948359)
        let traderJoes = insertStore(name: "Trader Joe's", address1: "8960 Hudson Rd", address2: "Ste 801", city: "Woodbury", state: "MN", zip: "55125", latitude: 44.954259, longitude: -92.923616)
        let kowalskis = insertStore(name: "Kowalski's Woodbury Market", address1: "8505 Valley Creek Rd", address2: "", city: "Woodbury", state: "MN", zip: "55125", latitude: 44.921907, longitude: -92.933129)
        let lunds = insertStore(name: "Lunds & Byerlys", address1: "7050 Valley Creek Plaza", address2: "", city: "Woodbury", state: "MN", zip: "55125", latitude: 44.927892, longitude: -92.963834)
        let cub = insertStore(name: "Cub Foods", address1: "8432 Tamarack Village", address2: "", city: "Woodbury", state: "MN", zip: "55125", latitude: 44.943526, longitude: -92.936222)
        let spiceBazaar = insertStore(name: "Spice Bazaar", address1: "1580 Woodlane Dr #2", address2: "", city: "Woodbury", state: "MN", zip: "55125", latitude: 44.929819, longitude: -92.967305)
        let target = insertStore(name: "Target Grocery", address1: "7200 Valley Creek Plaza", address2: "", city: "Woodbury", state: "MN", zip: "55125", latitude: 44.927486, longitude: -92.959131)


        let jerrysList1 = insertList(name: jerrys.name! + " List 1", open: true, store: jerrys)
        _ = insertList(name: jerrys.name! + " List 2", open: true, store: jerrys)
        _ = insertList(name: traderJoes.name! + " List 1", open: true, store: traderJoes)
        _ = insertList(name: kowalskis.name! + " List 1", open: true, store: kowalskis)
        _ = insertList(name: lunds.name! + " List 1", open: true, store: lunds)
        _ = insertList(name: cub.name! + " List 1", open: true, store: cub)
        _ = insertList(name: spiceBazaar.name! + " List 1", open: true, store: spiceBazaar)
        let targetList1 = insertList(name: target.name! + " List 1", open: true, store: target)
        _ = insertList(name: target.name! + " List 2", open: true, store: target)

        _ = insertListItem(item: cheezit, quantity: 1, list: jerrysList1)
        _ = insertListItem(item: pudding, quantity: 2, list: targetList1)

    }
    
    func insertItem(name: String, sku: String) -> Item {
        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        let item = ItemBuilder(context: context!)
            .name(name: name)
            .sku(sku: sku)
            .build()

        // Save the context.
        do {
            try context!.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return item;
    }

    func insertListItem(item: Item, quantity: NSDecimalNumber, list: List) -> ListItem {
        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        let listItem = ListItemBuilder(context: context!)
            .item(item: item)
            .quantity(quantity: quantity)
            .list(list: list)
            .build()

        // Save the context.
        do {
            try context!.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return listItem;
    }
    
//    func insertItem(name: String, sku: String) -> Item {
//        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
//
//        let item = ItemBuilder(context: context!)
//            .name(name: name)
//            .sku(sku: sku)
//            .build()
//
//        // Save the context.
//        do {
//            try context!.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//        }
//
//        return item;
//    }
    
    func insertList(name: String, open: Bool, store: Store) -> List {
        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        let list = ListBuilder(context: context!)
            .name(name: name)
            .open(open: open)
            .store(store: store)
            .build()

        // Save the context.
        do {
            try context!.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return list;
    }

    func insertStore(name: String, address1: String, address2: String, city: String, state: String, zip: String, latitude: NSDecimalNumber, longitude: NSDecimalNumber) -> Store {

        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        let store = StoreBuilder(context: context!)
            .name(name: name)
            .address1(address1: address1)
            .address2(address2: address2)
            .city(city: city)
            .state(state: state)
            .zip(zip: zip)
            .latitude(latitude: latitude)
            .longitude(longitude: longitude)
            .build();
        

        // Save the context.
        do {
            try context!.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return store
    }
    


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "shopper")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

