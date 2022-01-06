//
//  StoryboardCollectionViewCell.swift
//  SP_PODS
//
//  Created by 이상봉 on 2022/01/06.
//

import UIKit

class StoryboardCollectionViewCell: UICollectionViewCell {
    
    // Cell에 들어갈 이미지뷰와 라벨 IBOutlet 변수로 연결
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
}
