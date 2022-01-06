//
//  UIKitCodeTableViewCell.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/05.
//

import UIKit

class UIKitCodeTableViewCell: UITableViewCell {

    // init 생성
    // 인터페이스 빌더에서는 자동으로 초기화 해주지만 코드에서는 인터페이스 빌더를 사용하는 것이 아니기 때문입니다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // identifier를 선언 - 에러 발생을 줄임
    static let identifier = "UIKitCodeTableViewCell"
    
    // 이미지 뷰 생성
    let restaurantImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // 이름을 나타내는 라벨 생성
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 위치를 나타내는 라벨 생성
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 종류를 나타내는 라벨 생성
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func configureCell() {
        contentView.addSubview(restaurantImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(typeLabel)
        
        NSLayoutConstraint.activate([
            // 이미지 레이아웃 설정
            restaurantImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            restaurantImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            restaurantImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            restaurantImage.widthAnchor.constraint(equalTo: restaurantImage.heightAnchor),
            
            // namLabel 레이아웃 설정
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // locationLabel 레이아웃 설정
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            locationLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // typeLabel 레이아웃 설정
            typeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20),
            typeLabel.leadingAnchor.constraint(equalTo: restaurantImage.trailingAnchor, constant: 20),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            typeLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 160),
            typeLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
