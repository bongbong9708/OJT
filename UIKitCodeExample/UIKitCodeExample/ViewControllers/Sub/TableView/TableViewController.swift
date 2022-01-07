//
//  TableViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/05.
//

import UIKit
import SnapKit

class TableViewController: UIViewController {
    
    // 테이블 뷰 생성
    let tableView: UITableView = {
        let table = UITableView()
        // UIKitCodeTableViewCell을 tableView에 등록
        table.register(UIKitCodeTableViewCell.self, forCellReuseIdentifier: UIKitCodeTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "TableView"
        
        // 대리자 위임
        tableView.delegate = self
        tableView.dataSource = self
        
        configureTableView()        // 테이블 뷰
    }
    
    func configureTableView() {
        // view에 tableView 추가
        view.addSubview(tableView)
        
        // tableView 레이아웃 설정
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    // 섹션의 수를 지정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 레스토랑의 수만큼 row 생성
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data().restaurantNames.count
    }
    
    // cell에 배열 순서에 맞는 데이터를 삽입
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIKitCodeTableViewCell.identifier, for: indexPath) as! UIKitCodeTableViewCell
        
        cell.restaurantImage.image = UIImage(named: Data().restaurantImages[indexPath.row])
        cell.nameLabel.text = Data().restaurantNames[indexPath.row]
        cell.locationLabel.text = Data().restaurantLocations[indexPath.row]
        cell.typeLabel.text = Data().restaurantTypes[indexPath.row]
    
        return cell
    }
    
    // row 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // Section Header 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Restaurant List"
    }
    
    // cell을 select하여 다른 화면으로 전환할 수 있지만 우선 select되면 deselect되도록 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
