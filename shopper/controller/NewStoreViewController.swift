//
//  NewStoreViewController.swift
//  shopper
//
//  Created by Chuck Pilon on 1/12/20.
//  Copyright © 2020 Pilon Apps, Inc. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NewStoreViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New Store"
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        navigationItem.leftBarButtonItem = cancelButton

        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        navigationItem.rightBarButtonItem = saveButton
    }

    @objc
    func cancel(_ sender: Any) {
        dismiss(animated: true, completion: {})
    }

    @objc
    func save(_ sender: Any) {
        // TODO: Save managed object
        let nameView = self.view.viewWithTag(1) as! UITextField
        let name = nameView.text
        let address1 = "6984 Wyndham Way"
        let address2 = ""
        let city = "Woodbury"
        let state = "MN"
        let zip = "55125"
        let latitude = 44.903882 as NSDecimalNumber
        let longitude = -92.957016 as NSDecimalNumber;

        let context: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        _ = StoreBuilder(context: context!)
            .name(name: name!)
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

        dismiss(animated: true, completion: {})
    }
    
}
