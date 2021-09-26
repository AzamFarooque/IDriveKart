//
//  IkartCartItemListPresenter.swift
//  IDriveKart
//
//  Created by Farooque Azam on 26/09/21.
//

import Foundation


class IkartCartItemListPresenter : ViewToPresenterCartItemListProtocol{
    
    // MARK: Properties
    
    var view: PresenterToViewCartItemListProtocol?
    var interactor: PresenterToInteractorCartItemListProtocol?
    var router: PresenterToRouterCartItemListProtocol?
    var iKartCartItemList: [IKartItem]?
    
    // MARK: Inputs from view
    
    func viewDidLoad() {
        view?.showHUD()
        interactor?.fetchcartList()
    }
    
    func removeItemFromCart(item: IKartItem) -> Bool {
        return ((interactor?.removeItemFromcart(item: item)) != nil)
    }
    
    func numberOfRowsInSection() -> Int {
        return iKartCartItemList?.count ?? 0
    }
}

// MARK: - Outputs to view

extension IkartCartItemListPresenter : InteractorToPresenterCartItemListProtocol  {
    
    func fetchCartItemList(quotes: [IKartItem]) {
        self.iKartCartItemList = quotes
        view?.hideHUD()
        view?.onFetchCartItemListSuccess()
    }
}
