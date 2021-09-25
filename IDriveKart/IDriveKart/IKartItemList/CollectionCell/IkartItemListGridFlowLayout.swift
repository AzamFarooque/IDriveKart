//
//  IkartItemListGridFlowLayout.swift
//  IDriveKart
//
//  Created by Farooque Azam on 25/09/21.
//


import UIKit

final class IkartItemListGridFlowLayout: UICollectionViewFlowLayout {
    let itemHeight: CGFloat = 150
    override init() {
        super.init()
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    func itemWidth() -> CGFloat {
        return (collectionView!.frame.width)-1
    }
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width :itemWidth(),height : itemHeight)
        }
        get {
            return CGSize(width :itemWidth(),height : itemHeight)
        }
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
