//
//  ModalViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2021/12/30.
//

import UIKit

class ModalViewController: UIViewController {

    // Dismiss 버튼 생성
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backToVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        // 뷰에 서브뷰 추가
        view.addSubview(button)
        
        // 레이아웃 설정
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    // VC로 돌아가는 dismiss 생성
    @objc func backToVC() {
        dismiss(animated: true, completion: nil)
    }
}
