//
//  IKartItemListPresenter.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation
import UIKit


class IKartItemListPresenter : ViewToPresenterItemListProtocol{
    
    
    var view: PresenterToViewItemListProtocol?
    var interactor: PresenterToInteractorItemListProtocol?
    var router: PresenterToRouterItemListProtocol?
    
    var iKartItemList: [IKartItem]?
    var iKartCartItemList: [IKartItem]?
    
    
    
    
    func refresh() {
        interactor?.loadQuotes()
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
    
    
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
    
    func interactorDidFetchIKartItemList(with Result: Result<[IKartItem], Error>) {
        
    }
    
    func viewDidLoad() {
        self.iKartItemList = []
        view?.showHUD()
        interactor?.fetchcartList()
        interactor?.loadQuotes()
    }
    
}


extension IKartItemListPresenter : InteractorToPresenterItemListProtocol  {
    
    func fetchQuotesSuccess(quotes: [IKartItem]) {
        self.iKartItemList! += quotes
        view?.hideHUD()
        view?.onFetchQuotesSuccess()
    }
    
    func fetchQuotesFailure(errorCode: Int) {
        
    }
    
    func fetchCartItemList(quotes: [IKartItem]) {
        self.iKartCartItemList = quotes
        view?.onFetchCartItemListSuccess()
    }
}
