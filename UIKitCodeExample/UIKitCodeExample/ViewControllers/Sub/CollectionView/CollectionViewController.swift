//
//  CollectionViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/05.
//

import UIKit

class CollectionViewController: UIViewController {

    // collectionViewCell에 들어갈 데이터
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]

    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    // 컬렉션 뷰 생성
    let collectionView: UICollectionView = {
        // 컬렉션 뷰를 생성할 때 레이아웃으로 초기화
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // 컬렉션 뷰 섹션의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // 컬렉션 뷰 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantImages.count
    }

    // 컬렉션 뷰 셀을 구하는 함수
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! UIKitCodeCollectionViewCell
    
        cell.restaurantImage.image = UIImage(named: restaurantImages[indexPath.row])
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
    
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    // 컬렉션 뷰 셀의 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collWidth = collectionView.frame.width / 3 - 4
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
