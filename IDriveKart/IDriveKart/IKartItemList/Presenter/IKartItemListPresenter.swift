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
    
    var quotesStrings: [IKartItem]?
    
    
    
    
    func refresh() {
        interactor?.loadQuotes()
    }
    
    func numberOfRowsInSection() -> Int {
        return quotesStrings?.count ?? 0
    }
    
    
    
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
    
    func interactorDidFetchIKartItemList(with Result: Result<[IKartItem], Error>) {
        
    }
    
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadQuotes()
    }
    
}


extension IKartItemListPresenter : InteractorToPresenterItemListProtocol  {
    
    func fetchQuotesSuccess(quotes: [IKartItem]) {
        self.quotesStrings = quotes
        view?.hideHUD()
        view?.onFetchQuotesSuccess()
    }
    
    func fetchQuotesFailure(errorCode: Int) {
        
    }
}
