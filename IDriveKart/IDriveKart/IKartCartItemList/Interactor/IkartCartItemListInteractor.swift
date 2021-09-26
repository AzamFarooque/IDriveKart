//
//  IkartCartItemListInteractor.swift
//  IDriveKart
//
//  Created by Farooque Azam on 26/09/21.
//

import Foundation


class IkartCartItemListInteractor : PresenterToInteractorCartItemListProtocol{
    var presenter: InteractorToPresenterCartItemListProtocol?
    private let manager: DataBaseManager = DataBaseManager()
    
    func fetchcartList() {
        self.presenter?.fetchCartItemList(quotes: self.manager.fetchCartItemList()!)
    }
    
    func removeItemFromcart(item: IKartItem) ->Bool {
        return self.manager.updateCartValue(employee: item)
    }
}
