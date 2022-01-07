//
//  UIKitCodeCollectionViewCell.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/05.
//

import UIKit
import SnapKit

class UIKitCodeCollectionViewCell: UICollectionViewCell {
    
    // 초기화를 시켜줘야 합니다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이미지 뷰 생성
    let restaurantImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    // 이름을 나타내는 라벨 생성
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    // 위치를 나타내는 라벨 생성
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    // 종류를 나타내는 라벨 생성
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    func configureCell() {
        addSubview(restaurantImage)
        // 이미지 레이아웃 설정
//        NSLayoutConstraint.activate([
//            restaurantImage.topAnchor.constraint(equalTo: self.topAnchor),
//            restaurantImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            restaurantImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            restaurantImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
        restaurantImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureLabel() {
        // 이미지 위에 라벨 추가
        restaurantImage.addSubview(nameLabel)
        restaurantImage.addSubview(locationLabel)
        restaurantImage.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            // namLabel 레이아웃 설정
//            nameLabel.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: -55),
//            nameLabel.leadingAnchor.constraint(equalTo: restaurantImage.leadingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: -10),
//            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            
            // locationLabel 레이아웃 설정
//            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
//            locationLabel.leadingAnchor.constraint(equalTo: restaurantImage.leadingAnchor, constant: 10),
//            locationLabel.trailingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: -10),
//            locationLabel.heightAnchor.constraint(equalToConstant: 10),
            
            // typeLabel 레이아웃 설정
//            typeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
//            typeLabel.leadingAnchor.constraint(equalTo: restaurantImage.leadingAnchor, constant: 10),
//            typeLabel.trailingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: -10),
//            typeLabel.bottomAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: -10),
//            typeLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(restaurantImage.snp.bottom).offset(-55)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(15)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(10)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(10)
        }
        
    }
}
