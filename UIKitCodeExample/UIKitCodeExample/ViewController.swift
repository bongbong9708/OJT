//
//  ViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2021/12/30.
//

import UIKit

class ViewController: UIViewController {

    // Modal 버튼 생성 - Present & Dismiss
    let modal: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(moveToModalVC), for: .touchUpInside)
        return button
    }()
    
    // Navigation 버튼 생성 - Push & Pop
    let navigation: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(moveToNaviVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Segue"
        view.backgroundColor = .systemBackground
        
        // View에 모달,내비게이션 버튼 추가
        view.addSubview(modal)
        view.addSubview(navigation)
        
        
        // 버튼의 레이아웃을 코드로 직접 수정 가능하도록 설정
        modal.translatesAutoresizingMaskIntoConstraints = false
        navigation.translatesAutoresizingMaskIntoConstraints = false
        
        // 레이아웃 설정
        modal.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        modal.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100).isActive = true
        
        // 위와 같은 표현
        let navCenterXConstraint = navigation.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        let navCenterYConstraint = navigation.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        [navCenterXConstraint, navCenterYConstraint].forEach { $0.isActive = true }
        
        // 추후 snapkit을 연습할때 수정예정
    }
    
    // ModalVC로 보내는 present 생성
    @objc func moveToModalVC() {
        let modalVC = ModalViewController()
        // TransitionStyle, PresentationStyle 수정가능
        modalVC.modalTransitionStyle = .coverVertical
        modalVC.modalPresentationStyle = .pageSheet
        self.present(modalVC, animated: true, completion: nil)
    }
    
    // NaviVC로 보내는 push 생성
    @objc func moveToNaviVC() {
        let naviVC = NaviViewController()
        self.navigationController?.pushViewController(naviVC, animated: true)
    }
}

