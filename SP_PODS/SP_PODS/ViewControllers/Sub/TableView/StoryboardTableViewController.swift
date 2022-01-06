//
//  StoryboardTableViewController.swift
//  SP_PODS
//
//  Created by 이상봉 on 2022/01/06.
//

import UIKit

class StoryboardTableViewController: UIViewController {
    
    // tableView IBOutlet선언
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = "Storyboard TableView"
        
        // UITableViewDelegate, UITableViewDataSource 프로토콜을 채택
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension StoryboardTableViewController: UITableViewDelegate, UITableViewDataSource {
    // 섹션의 수를 지정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 레스토랑의 수만큼 row 생성
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data().restaurantImages.count
    }
    
    // cell에 배열 순서에 맞는 데이터를 삽입
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryboardTableViewCell", for: indexPath) as! StoryboardTableViewCell
        
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
