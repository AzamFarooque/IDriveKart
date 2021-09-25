//
//  IKartItemListInteractor.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation


class IKartItemListInteractor : PresenterToInteractorItemListProtocol{
    
    var presenter: InteractorToPresenterItemListProtocol?
    
    var quotes: [IKartItem]?
    
    func loadQuotes() {
        let urlString = URL(string : APIManager.shared.baseURL)
        APIClient.shared.getAPiData(requestURL: urlString!, resultType: IKartItem.self) { [weak self] (data, error) in
            if error == nil {
                self?.quotes = data as? [IKartItem]
                self?.presenter?.fetchQuotesSuccess(quotes: self?.quotes ?? [])
            }else{
                self?.presenter?.fetchQuotesFailure(errorCode: 0)
            }
        }
    }
}
