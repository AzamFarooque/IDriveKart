//
//  IkartItemListTableViewCell.swift
//  IDriveKart
//
//  Created by Farooque Azam on 25/09/21.
//

import UIKit

class IkartItemListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImgView: LazyImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var addToCartBtn: Button!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    func update(item : IKartItem){
        itemName.text = "\(item.name ?? "")"
        itemPrice.text = "₹ : \(item.price ?? "")"
        itemDescription.text = item.description ?? ""
        let imgUrl = URL(string: item.image ?? "")
        itemImgView.loadImageWithUrl(imgUrl!)
        
        if item.inCart ?? false{
            addToCartBtn.setImage(#imageLiteral(resourceName: "addIntoCartIcon"), for: .normal)
        }else{
            addToCartBtn.setImage(#imageLiteral(resourceName: "removeFromCartIcon"), for: .normal)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImgView?.image = nil
    }
}
