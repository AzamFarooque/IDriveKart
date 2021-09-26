//
//  IkartCartItemListRouter.swift
//  IDriveKart
//
//  Created by Farooque Azam on 26/09/21.
//

import Foundation
import UIKit

class IkartCartItemListRouter: PresenterToRouterCartItemListProtocol {
  
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
       
        let viewController = IkartCartItemListViewController()
        
        let presenter: ViewToPresenterCartItemListProtocol & InteractorToPresenterCartItemListProtocol = IkartCartItemListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = IkartCartItemListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = IkartCartItemListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
}
