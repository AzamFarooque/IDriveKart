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
    
    func fetchEmployee(byIdentifier id: String) -> IKartItem?{
        
        return _itemDataRepository.get(byIdentifier: id)
    }
    
    func updateEmployee(employee: IKartItem) -> Bool {
        return _itemDataRepository.update(item: employee)
    }
    
    //
    //    func deleteEmployee(id: UUID) -> Bool {
    //        return _employeeDataRepository.delete(id: id)
    //    }
}
