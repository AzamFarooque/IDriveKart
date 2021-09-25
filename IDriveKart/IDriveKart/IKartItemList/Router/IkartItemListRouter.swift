//
//  IkartItemListRouter.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation
import UIKit


class IKartItemListRouter : PresenterToRouterItemListProtocol{
    
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = IKartItemListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterItemListProtocol & InteractorToPresenterItemListProtocol = IKartItemListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = IKartItemListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = IKartItemListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - Navigation
//    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote) {
//
//
//    }
    
}
