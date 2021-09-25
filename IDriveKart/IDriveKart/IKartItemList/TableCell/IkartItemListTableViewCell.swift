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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImgView?.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
