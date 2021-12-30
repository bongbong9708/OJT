//
//  NaviViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2021/12/30.
//

import UIKit

class NaviViewController: UIViewController {

    // Pop 버튼 생성
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Pop", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backToVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        // 뷰에 서브뷰 추가
        view.addSubview(button)
        
        // 레이아웃 설정
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    @objc func backToVC() {
        // 이전 ViewController로 이동
        navigationController?.popViewController(animated: true)
        // RootViewController로 이동
//        navigationController?.popToRootViewController(animated: true)
        // 원하는 ViewController로 이동
//        navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }

}
