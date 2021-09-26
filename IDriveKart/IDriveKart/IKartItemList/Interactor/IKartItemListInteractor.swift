//
//  IKartItemListInteractor.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation


class IKartItemListInteractor : PresenterToInteractorItemListProtocol{
   
    
    private let manager: DataBaseManager = DataBaseManager()
    var presenter: InteractorToPresenterItemListProtocol?
    
    var quotes: [IKartItem]?
    
    func loadQuotes() {
        let urlString = URL(string : APIManager.shared.baseURL)
        APIClient.shared.getAPiData(requestURL: urlString!, resultType: IKartItem.self) { [weak self] (data, error) in
            if error == nil {
                self?.quotes = data as? [IKartItem]
                self?.manager.saveItemList(employee: self?.quotes ?? [])
                self?.presenter?.fetchQuotesSuccess(quotes: self?.manager.fetchItemList(offset: 0) ?? [])
            }else{
                self?.presenter?.fetchQuotesFailure(errorCode: 0)
            }
        }
    }
    
    func loadNextPage(offset : Int) {
        self.presenter?.fetchQuotesSuccess(quotes: self.manager.fetchItemList(offset: offset) ?? [])
    }
    
    func addTocart(item: IKartItem) ->Bool {
        return self.manager.updateEmployee(employee: item)
    }
    
    func fetchcartList() {
        self.presenter?.fetchCartItemList(quotes: self.manager.fetchCartItemList()!)
    }
}
