//
//  IKartItemListInteractor.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation


class IKartItemListInteractor : PresenterToInteractorItemListProtocol{
    
    // MARK: Properties
    
    private let manager: DataBaseManager = DataBaseManager()
    var presenter: InteractorToPresenterItemListProtocol?
    var quotes: [IKartItem]?
    
    // MARK: Fetch from server then save and retrive from database
    
    func getItemList() {
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
    
    // MARK: Pagination
    
    func loadNextPage(offset : Int) {
        self.presenter?.fetchQuotesSuccess(quotes: self.manager.fetchItemList(offset: offset) ?? [])
    }
    
    // MARK: Add to cart
    
    func addTocart(item: IKartItem) ->Bool {
        return self.manager.updateCartValue(employee: item)
    }
    
    // MARK: Fetch cart list
    
    func fetchcartList() {
        self.presenter?.fetchCartItemList(quotes: self.manager.fetchCartItemList()!)
    }
}
