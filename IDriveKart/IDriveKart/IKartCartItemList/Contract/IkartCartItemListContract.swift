//
//  IkartCartItemListContract.swift
//  IDriveKart
//
//  Created by Farooque Azam on 26/09/21.
//

import UIKit



// MARK: View Output (Presenter -> View)
protocol PresenterToViewCartItemListProtocol: AnyObject {
    func onFetchCartItemListSuccess()
    
    func showHUD()
    func hideHUD()
}


//  MARK: View Input (View -> Presenter)
protocol ViewToPresenterCartItemListProtocol: AnyObject {
    
    var view: PresenterToViewCartItemListProtocol? { get set }
    var interactor: PresenterToInteractorCartItemListProtocol? { get set }
    var router: PresenterToRouterCartItemListProtocol? { get set }
    
    func viewDidLoad()
    
    func removeItemFromCart(item : IKartItem) -> Bool
    
    var iKartCartItemList: [IKartItem]? { get set }
    
    func numberOfRowsInSection() -> Int
    
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCartItemListProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCartItemListProtocol? { get set }
    
    func fetchcartList()
    
    func addTocart(item : IKartItem) -> Bool
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCartItemListProtocol: AnyObject {
    func fetchCartItemList(quotes: [IKartItem])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCartItemListProtocol: AnyObject {
    
    static func createModule() -> UIViewController
}
