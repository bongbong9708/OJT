//
//  XibCollectionViewCell.swift
//  SP_PODS
//
//  Created by 이상봉 on 2022/01/06.
//

import UIKit

class XibCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
