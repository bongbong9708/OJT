//
//  CollectionViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/05.
//

import UIKit
import SnapKit

class CollectionViewController: UIViewController {

    // 컬렉션 뷰 생성
    let collectionView: UICollectionView = {
        // 컬렉션 뷰를 생성할 때 레이아웃으로 초기화
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CollectionView"
        collectionView.backgroundColor = .systemBackground

        // 셀 등록하기
        collectionView.register(UIKitCodeCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        
        // 대리자 위임
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configureCollectionView()       // 컬렉션 뷰
    }
    
    func configureCollectionView() {
        // 뷰에 컬렉션 뷰 생성
        view.addSubview(collectionView)
        
        // 컬렉션 뷰 레이아웃 설정
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! UIKitCodeCollectionViewCell
    
        cell.restaurantImage.image = UIImage(named: Data().restaurantImages[indexPath.row])
        cell.nameLabel.text = Data().restaurantNames[indexPath.row]
        cell.locationLabel.text = Data().restaurantLocations[indexPath.row]
        cell.typeLabel.text = Data().restaurantTypes[indexPath.row]
    
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
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
