//
//  DelegateViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/07.
//

import UIKit
import SnapKit

// 2. UITextFieldDelegate 채택
class DelegateViewController: UIViewController, UITextFieldDelegate {
    
    /*
     Delegate
     - 프로토콜: 서로간의 지켜야할 일종의 약속, 규약
     - 델리게이트: 어떤 객체가 해야 하는 일을 부분적으로 확장해서 대신 처리를 한다.
        - 어떤 객체가 해야하는 일을 부분적으로 확장해서 대신 처리를 한다.
     - 적용방법
        - 1. 요구사항 파악한다.
        - 2. Delegation을 따른다/채택한다.
        - 3. Delegate 객체(일을 시키는 객체)와 연결을 한다.
        - 4. 요구사항 구현한다.
     */
    
    /*
     Delegate 예시
     1. 버튼을 부르면 텍스트 필드의 텍스트가 라벨에 적용되도록 텍스트필드, 버튼, 라벨 생성
     2. Delegate 채택
     3. 요구사항 구현
     */
    
    // 1. 텍스트라벨 생성
    let textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .lightGray
        field.borderStyle = .roundedRect
        field.clearButtonMode = .whileEditing
        field.placeholder = "TextField 내용을 입력하세요."
        return field
    }()
    
    // 1. 버튼 생성
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Btn", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btn.addTarget(self, action: #selector(didTapTextFieldBtn), for: .touchUpInside)
        return btn
    }()
    
    // 1. 라벨 생성
    let label: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.backgroundColor = .lightGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Delegate"
        
        configureText()
        
        // 2. 위임자 설정
        // self = DelegateViewController
        textField.delegate = self
    }
    
    // 1. 서브뷰 추가 및 레이아웃 설정
    func configureText() {
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(40)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(textField).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(30)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(button).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(30)
        }
    }
    
    // 1. 버튼 누르면 텍스트 필드의 텍스트와 라벨의 텍스트가 같아지게하는 함수 생성
    @objc func didTapTextFieldBtn() {
        label.text = textField.text
    }
    
    // 3. 엔터를 누르면 텍스트필드의 값을 라벨에 옮겨주는 함수 선언
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        label.text = textField.text
        return true
    }
}
