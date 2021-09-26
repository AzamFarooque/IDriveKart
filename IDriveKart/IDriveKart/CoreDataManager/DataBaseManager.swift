//
//  RegisterEmployeeManager.swift
//  IDriveKart
//
//  Created by Farooque Azam on 18/09/21.
//

import Foundation

struct DataBaseManager{
    
    
    private let _itemDataRepository = IkartItemDataRepository()
    
    func saveItemList(employee: [IKartItem]) {
        _itemDataRepository.saveItemLList(itemList: employee)
    }
    
    func fetchItemList(offset : Int) -> [IKartItem]? {
        return _itemDataRepository.fetchItemList(offset : offset)
    }
    
    func fetchCartItemList() -> [IKartItem]? {
        return _itemDataRepository.fetchCartItemList()
    }
    
    func updateCartValue(item: IKartItem) -> Bool {
        return _itemDataRepository.update(item: item)
    }
}
