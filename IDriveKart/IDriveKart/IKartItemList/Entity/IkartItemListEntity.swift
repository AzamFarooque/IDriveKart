//
//  IkartItemListEntity.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation

// MARK: Item list entity

struct IKartItem : Decodable {
    var id : String?
    var name : String?
    var image : String?
    var description : String?
    var price : String?
    var inCart : Bool?
}
