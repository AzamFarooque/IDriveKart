//
//  IKartItemListView.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation
import UIKit


class IKartItemListViewController : UIViewController {
    
    //MARK:- Properties
    
    var presenter : ViewToPresenterItemListProtocol?
    let pagingSpinner = UIActivityIndicatorView()
    var offset : Int = 0
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
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
        view.backgroundColor = .white
        setupUI()
        registerCell()
        tableView.tableFooterView = UIView()
        self.navigationItem.title = IDrivekartConstant.Title.ItemListTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        offset = 0
        presenter?.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc func refresh() {
        offset = 0
        presenter?.refresh()
    }
}


extension IKartItemListViewController : PresenterToViewItemListProtocol{
    
    func onFetchItemListSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func onFetchItemListFailure(error: String) {
        
    }
    
    func onFetchCartItemListSuccess(){
        
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



// MARK: - UI setup and register cell

extension IKartItemListViewController {
    func setupUI() {
        
        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        tableView.tableFooterView = UIView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cartICon"), style: .plain, target: self, action: #selector(addTapped))
        
        
    }
    
    @objc func addTapped(){
        presenter?.pushToCartList()
    }
    
    func registerCell(){
        let nib1 = UINib(nibName: IkartItemListTableViewCell.identifier, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: IkartItemListTableViewCell.identifier)
        
    }
}

// MARK: - Tableview delegates and datasources

extension IKartItemListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard (presenter?.iKartItemList?.count) != 0  else {
            return UITableViewCell()}
        let cell = (tableView.dequeueReusableCell(withIdentifier: IkartItemListTableViewCell.identifier, for: indexPath) as! IkartItemListTableViewCell)
        let iKartItem = presenter?.iKartItemList?[indexPath.row]
        if let item = iKartItem{
            cell.update(item: item)
        }
        cell.addToCartBtn.didTouchUpInside = { [weak self , iKartItem] _ in
            if ((self?.presenter?.addTocart(item: iKartItem!)) != nil) {
                let bool = self?.presenter?.iKartItemList?[indexPath.row].inCart
                self?.presenter?.iKartItemList?[indexPath.row].inCart = !(bool ?? false)
                self?.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (presenter?.numberOfRowsInSection())! - 1 && (presenter?.numberOfRowsInSection())! < 77{
            offset += 10
            presenter?.loadNextPage(offset: offset)
            self.setTableFooter()
        }
    }
    
    func setTableFooter()  {
        pagingSpinner.startAnimating()
        pagingSpinner.color = UIColor.black
        pagingSpinner.hidesWhenStopped = true
        tableView.tableFooterView = pagingSpinner
    }
}
