//
//  IkartCartItemListPresenter.swift
//  IDriveKart
//
//  Created by Farooque Azam on 26/09/21.
//

import Foundation


class IkartCartItemListPresenter : ViewToPresenterCartItemListProtocol{
   
    
    
    var view: PresenterToViewCartItemListProtocol?
    var interactor: PresenterToInteractorCartItemListProtocol?
    var router: PresenterToRouterCartItemListProtocol?
    
    var iKartCartItemList: [IKartItem]?
    
    func viewDidLoad() {
        view?.showHUD()
        interactor?.fetchcartList()
    }
    
    func removeItemFromCart(item: IKartItem) -> Bool {
        return ((interactor?.addTocart(item: item)) != nil)
    }
    
    func numberOfRowsInSection() -> Int {
        return iKartCartItemList?.count ?? 0
    }
    
}


extension IkartCartItemListPresenter : InteractorToPresenterCartItemListProtocol  {
    
    func fetchCartItemList(quotes: [IKartItem]) {
        self.iKartCartItemList = quotes
        view?.hideHUD()
        view?.onFetchCartItemListSuccess()
    }
}
