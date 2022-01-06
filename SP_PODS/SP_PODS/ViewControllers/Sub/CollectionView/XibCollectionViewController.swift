//
//  XibCollectionViewController.swift
//  SP_PODS
//
//  Created by 이상봉 on 2022/01/06.
//

import UIKit

class XibCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionNib = UINib(nibName: "XibCollectionViewCell", bundle: nil)
        collectionView.register(collectionNib, forCellWithReuseIdentifier: "xibCollectionViewCell")
    }
}

extension XibCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 컬렉션 뷰 섹션의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // 컬렉션 뷰 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data().restaurantImages.count
    }
    
    // 컬렉션 뷰 셀을 구하는 함수
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "xibCollectionViewCell", for: indexPath) as! XibCollectionViewCell
    
        cell.restaurantImage.image = UIImage(named: Data().restaurantImages[indexPath.row])
        cell.nameLabel.text = Data().restaurantNames[indexPath.row]
        cell.locationLabel.text = Data().restaurantLocations[indexPath.row]
        cell.typeLabel.text = Data().restaurantTypes[indexPath.row]
    
        return cell
    }
}

extension XibCollectionViewController: UICollectionViewDelegateFlowLayout {
    // 컬렉션 뷰 셀의 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collWidth = collectionView.frame.width / 3 - 1
        return CGSize(width: collWidth, height: collWidth)
    }

    // 셀 간의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    // 셀 간의 좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
