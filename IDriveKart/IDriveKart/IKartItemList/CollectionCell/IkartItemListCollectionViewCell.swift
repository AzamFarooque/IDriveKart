//
//  IkartItemListCollectionViewCell.swift
//  IDriveKart
//
//  Created by Farooque Azam on 25/09/21.
//

import UIKit

class IkartItemListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImgView: LazyImageView!
    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
