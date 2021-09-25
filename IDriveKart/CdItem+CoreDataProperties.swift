//
//  CdItem+CoreDataProperties.swift
//  IDriveKart
//
//  Created by Farooque Azam on 25/09/21.
//
//

import Foundation
import CoreData


extension CdItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CdItem> {
        return NSFetchRequest<CdItem>(entityName: "CdItem")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var itemId: String?
    @NSManaged public var itemImageURL: String?
    @NSManaged public var itemDesc: String?
    @NSManaged public var itemPrice: String?
    @NSManaged public var itemInCart: Bool
    
    func convertToEmployee() -> IKartItem {
        return IKartItem(id: self.itemId, name: self.itemName, image: self.itemImageURL, description: self.itemDesc, price: self.itemPrice , inCart: self.itemInCart)
    }

}

extension CdItem : Identifiable {

}
