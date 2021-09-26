//
//  EmployeeResource.swift
//  IDriveKart
//
//  Created by Farooque Azam on 25/09/21.
//

import Foundation
import CoreData


protocol IKarttemRepository {
    func saveItemLList(itemList : [IKartItem])
    func fetchItemList(offset : Int) -> [IKartItem]?
    func update(item: IKartItem) -> Bool
    func get(byIdentifier id: String) -> IKartItem?
    
}

struct IkartItemDataRepository : IKarttemRepository{
    
    // MARK: Save item list
    
    func saveItemLList(itemList: [IKartItem]) {
        for element in itemList{
            if get(byIdentifier: element.id!) == nil {
                let cdEmployee = CdItem(context: PersistentStorage.shared.context)
                cdEmployee.itemName = element.name
                cdEmployee.itemImageURL = element.image
                cdEmployee.itemPrice = element.price ?? ""
                cdEmployee.itemId = element.id
                cdEmployee.itemDesc = element.description
                PersistentStorage.shared.saveContext()
            }
        }
    }
    
    func fetchItemList(offset : Int) -> [IKartItem]? {
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CdItem.self , offset : offset)
        
        var employees : [IKartItem] = []
        
        result?.forEach({ (Item) in
            employees.append(Item.convertToEmployee())
        })
        
        return employees
    }
    
    
    
    func update(item : IKartItem) -> Bool {
        let cdEmployee = getCDEmployee(byIdentifier: item.id!)
        guard cdEmployee != nil else {return false}
        cdEmployee?.itemInCart = !item.inCart! 
        
        PersistentStorage.shared.saveContext()
        return true
    }
    
    
    func get(byIdentifier id: String) -> IKartItem? {
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToEmployee()
    }
    
    private func getCDEmployee(byIdentifier id: String) -> CdItem?
    {
        let fetchRequest = NSFetchRequest<CdItem>(entityName: "CdItem")
        let predicate = NSPredicate(format: "itemId==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            
            guard result != nil else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
    
}
