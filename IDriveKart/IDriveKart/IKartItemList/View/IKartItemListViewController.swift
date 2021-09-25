//
//  IKartItemListView.swift
//  IDriveKart
//
//  Created by Farooque Azam on 19/09/21.
//

import Foundation
import UIKit


class IKartItemListViewController : UIViewController , PresenterToViewItemListProtocol{
    
    func onFetchQuotesSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func onFetchQuotesFailure(error: String) {
        
    }
    
    func showHUD() {
        
    }
    
    func hideHUD() {
        
    }
    
    func deselectRowAt(row: Int) {
        
    }
    
    let gridFlowLayout = IkartItemListGridFlowLayout()
    var presenter : ViewToPresenterItemListProtocol?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        // refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    
    var cellId = "IkartItemListCollectionViewCell"
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
       // registerCell()
        presenter?.viewDidLoad()
        setupUI()
        registerCell()
        
        self.navigationItem.title = "IKart"
       
    }
}


extension IKartItemListViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: IkartItemListCollectionViewCell.identifier, for: indexPath) as! IkartItemListCollectionViewCell)
        cell.itemName.text = "\(presenter?.quotesStrings?[indexPath.row].name ?? "") Rs : \(presenter?.quotesStrings?[indexPath.row].price ?? "" )"
        cell.itemDescription.text = presenter?.quotesStrings?[indexPath.row].description ?? ""
        DispatchQueue.main.async{
            cell.itemImgView.loadImage(fromURL: URL(string : self.presenter?.quotesStrings?[indexPath.row].image ?? "")!)
        }
        cell.backgroundColor = .green
        return cell
    }
 
}


// MARK: - UI Setup

extension IKartItemListViewController {
    func setupUI() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 700)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.red
        self.view.addSubview(collectionView)
        
        self.navigationItem.title = "Simpsons Quotes"
    }
    
    func registerCell(){
        let nib1 = UINib(nibName: IkartItemListCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: IkartItemListCollectionViewCell.identifier)
        
    }
}


extension UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
}
