//
//  IkartItemListRouter.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import UIKit


class IKartItemListRouter : PresenterToRouterItemListProtocol{
    
    // MARK: Set item list 
    
    static func createModule() -> UINavigationController {
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
    
    func pushToCartList(on view: PresenterToViewItemListProtocol) {
        
        let quoteDetailViewController = IkartCartItemListRouter.createModule()
        let viewController = view as! IKartItemListViewController
        viewController.navigationController?
            .pushViewController(quoteDetailViewController, animated: true)
        
    }
    
}
