//
//  IkartCartItemListViewController.swift
//  IDriveKart
//
//  Created by Farooque Azam on 26/09/21.
//

import UIKit

class IkartCartItemListViewController: UIViewController {
    
    //MARK:- Properties
    
    var presenter : ViewToPresenterCartItemListProtocol?
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK:- ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupUI()
        presenter?.viewDidLoad()
        
        self.navigationItem.title = IDrivekartConstant.Title.CartListTitle
    }
}

extension IkartCartItemListViewController :  PresenterToViewCartItemListProtocol{
    
    func onFetchCartItemListSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showHUD() {
        DispatchQueue.main.async {
            self.tableView.showLoader()
        }
    }
    
    func hideHUD() {
        DispatchQueue.main.async {
            self.tableView.dismissloader()
        }
    }
}

// MARK: - Tableview delegate and datasource

extension IkartCartItemListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: IkartItemListTableViewCell.identifier, for: indexPath) as! IkartItemListTableViewCell)
        let iKartItem = presenter?.iKartCartItemList?[indexPath.row]
        if let item = iKartItem{
            cell.update(item: item)
        }
    
        cell.addToCartBtn.didTouchUpInside = { [weak self , iKartItem] _ in
            if ((self?.presenter?.removeItemFromCart(item: iKartItem!)) != nil) {
                self?.presenter?.iKartCartItemList?.remove(at: indexPath.row)
                self?.tableView.deleteRows(at: [indexPath], with: .fade)
                self?.tableView.reloadData()
            }
        }
        return cell
    }
}

// MARK: - UI setup and register cell

extension IkartCartItemListViewController {
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        tableView.tableFooterView = UIView()
    }
    
    func registerCell(){
        let nib1 = UINib(nibName: IkartItemListTableViewCell.identifier, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: IkartItemListTableViewCell.identifier)
        
    }
}
