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
    
    //    func fetchEmployee(byIdentifier id: UUID) -> Employee?
    //    {
    //        return _employeeDataRepository.get(byIdentifier: id)
    //    }
    //
    //    func updateEmployee(employee: Employee) -> Bool {
    //        return _employeeDataRepository.update(employee: employee)
    //    }
    //
    //    func deleteEmployee(id: UUID) -> Bool {
    //        return _employeeDataRepository.delete(id: id)
    //    }
}
