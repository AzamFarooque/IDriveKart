//
//  IkartItemListContract.swift
//  IDriveKart
//
//  Created by Farooque Azam on 25/09/21.
//



import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewItemListProtocol: AnyObject {
    func onFetchItemListSuccess()
    func onFetchItemListFailure(error: String)
    
    func onFetchCartItemListSuccess()
    
    func showHUD()
    func hideHUD()

}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterItemListProtocol: AnyObject {
    
    var view: PresenterToViewItemListProtocol? { get set }
    var interactor: PresenterToInteractorItemListProtocol? { get set }
    var router: PresenterToRouterItemListProtocol? { get set }
    
     var iKartItemList: [IKartItem]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func loadNextPage(offset : Int)
    
    func addTocart(item : IKartItem) -> Bool
    
    var iKartCartItemList: [IKartItem]? { get set }
    
    func numberOfRowsInSection() -> Int
  
    func pushToCartList()
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorItemListProtocol: AnyObject {
    
    var presenter: InteractorToPresenterItemListProtocol? { get set }
    
    func getItemList()
    
    func loadNextPage(offset : Int)
    
    func addTocart(item : IKartItem) -> Bool
    
    func fetchcartList()
  
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterItemListProtocol: AnyObject {
    
    func fetchItemListSuccess(itemsList: [IKartItem])
    func fetchItemListFailure(errorCode: Int)
    func fetchCartItemList(quotes: [IKartItem])
    
   
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterItemListProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
    
    func pushToCartList(on view: PresenterToViewItemListProtocol)
}
