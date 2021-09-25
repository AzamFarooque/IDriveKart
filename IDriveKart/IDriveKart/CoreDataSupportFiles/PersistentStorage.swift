//
//  PersistentStorage.swift
//  IDriveKart
//
//  Created by Farooque Azam on 25/09/21.
//

import Foundation
import CoreData


final class PersistentStorage{
    
    private init(){}
    static let shared = PersistentStorage()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "IDriveKart")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type , offset : Int) -> [T]?
    {
        do {
            let request = managedObject.fetchRequest()
            request.fetchLimit = 10
            request.fetchOffset = offset
            guard let result = try PersistentStorage.shared.context.fetch(request) as? [T] else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
}