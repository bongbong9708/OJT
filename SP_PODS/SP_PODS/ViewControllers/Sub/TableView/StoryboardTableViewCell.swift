//
//  StoryboardTableViewCell.swift
//  SP_PODS
//
//  Created by 이상봉 on 2022/01/06.
//

import UIKit

class StoryboardTableViewCell: UITableViewCell {

    // IBOutlet 선언
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
