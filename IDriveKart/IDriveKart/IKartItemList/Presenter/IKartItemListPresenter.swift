//
//  IKartItemListPresenter.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation
import UIKit


class IKartItemListPresenter : ViewToPresenterItemListProtocol{
    
    // MARK: Properties
    
    var view: PresenterToViewItemListProtocol?
    var interactor: PresenterToInteractorItemListProtocol?
    var router: PresenterToRouterItemListProtocol?
    var iKartItemList: [IKartItem]?
    var iKartCartItemList: [IKartItem]?
    
    // MARK: Inputs from view
    
    func pushToCartList() {
        router?.pushToCartList(on: view!)
    }
    
    func refresh() {
        self.iKartItemList = []
        interactor?.getItemList()
    }
    
    func numberOfRowsInSection() -> Int {
        return iKartItemList?.count ?? 0
    }
    
    func loadNextPage(offset: Int) {
        interactor?.loadNextPage(offset: offset)
    }
    
    func addTocart(item: IKartItem) ->Bool {
        return ((interactor?.addTocart(item: item)) != nil)
    }
    
    func viewDidLoad() {
        self.iKartItemList = []
        view?.showHUD()
        interactor?.fetchcartList()
        interactor?.getItemList()
    }
    
}

// MARK: - Outputs to view

extension IKartItemListPresenter : InteractorToPresenterItemListProtocol  {
    
    func fetchItemListSuccess(itemsList: [IKartItem]) {
        self.iKartItemList! += itemsList
        view?.hideHUD()
        view?.onFetchItemListSuccess()
    }
    
    func fetchItemListFailure(errorCode: Int) {
        
    }
    
    func fetchCartItemList(quotes: [IKartItem]) {
        self.iKartCartItemList = quotes
        view?.onFetchCartItemListSuccess()
    }
}
