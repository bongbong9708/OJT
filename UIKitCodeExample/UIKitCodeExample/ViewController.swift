//
//  ViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2021/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    // 1. Modal 버튼 생성 - Present & Dismiss
    let modal: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        // 버튼의 레이아웃을 코드로 직접 수정 가능하도록 설정
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToModalVC), for: .touchUpInside)
        return button
    }()
    
    // 1. Navigation 버튼 생성 - Push & Pop
    let navigation: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        // 버튼의 레이아웃을 코드로 직접 수정 가능하도록 설정
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToNaviVC), for: .touchUpInside)
        return button
    }()
    
    // 2-1. 스크롤 뷰 생성
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
        // 스크롤 뷰 수정 가능하도록 설정
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 2-2. 텍스트 뷰 생성
    let textView: UITextView = {
        let view = UITextView()
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.7).cgColor
        view.textContainerInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        view.font = .systemFont(ofSize: 18)
        view.text = "TextView 내용을 입력하세요."
        view.textColor = .lightGray
        // TextView 자체가 scrollable하기 때문에 ScrollView 안에 넣기 위해서 false를 해야한다.
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 2-2. textView에 입력받은 데이터 label로 띄우기
    let textViewLabel: UILabel = {
        let label = UILabel()
        label.text = "TextView 데이터가 들어가는 Label입니다."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .white
        label.numberOfLines = 12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 2-2. 버튼을 누르면 textView의 내용을 textViewLabel의 text로 바꾸기
    let textViewButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("텍스트뷰 데이터 가져오기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = .white
        // 버튼의 레이아웃을 코드로 직접 수정 가능하도록 설정
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapTextViewBtn), for: .touchUpInside)
        return btn
    }()
    
    // 2-3. 텍스트 필드 생성
    let textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.clearButtonMode = .whileEditing
        field.placeholder = "TextField 내용을 입력하세요."
        field.autocapitalizationType = .words
        field.translatesAutoresizingMaskIntoConstraints = false
//        field.textContentType = .creditCardNumber       // 숫자만 해당하는 키보드 출력
        return field
    }()
    
    // 2-3. 텍스트필드로 입력받은 데이터 label로 띄우기
    let textFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "TextFieldLabel"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 2-3. 버튼을 누르면 텍스트필드의 데이터를 라벨에 전달
    let textFieldButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Btn", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapTextFieldBtn), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Segue"
        view.backgroundColor = .systemBackground
        
        textView.delegate = self

        configureModalBtn()
        configureNaviBtn()
        
        configureScrollView()
        configureTextView()
        configureTextField()
        
        // TextView 데이터가져오기
        configureTextViewData()
        // TextField 데이터가져오기
        configureTextFieldData()
        
        // 다른 view를 tap하면 editing 종료
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView))
        view.addGestureRecognizer(tapGesture)

    }

    func configureModalBtn() {
        // 2-1. ScrollView에 모달 버튼 추가
        scrollView.addSubview(modal)
        
        // 2-1. modal 버튼 레이아웃 설정
        NSLayoutConstraint.activate([
            modal.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200),
            modal.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 150)
        ])
    }
    
    func configureNaviBtn() {
        // 2-1. ScrollView에 내비게이션 버튼 추가
        scrollView.addSubview(navigation)
        
        // 2-1. navigation 버튼 레이아웃 설정
        NSLayoutConstraint.activate([
            navigation.topAnchor.constraint(equalTo: modal.topAnchor, constant: 200),
            navigation.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 150)
        ])
    }
    
    func configureScrollView() {
        // 2-1.뷰에 scrollView 서브뷰 추가
        view.addSubview(scrollView)
        
        // 2-1. 스크롤뷰 제약조건 추가
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    func configureTextView() {
        // 2-2. ScrollView에 textView 추가
        scrollView.addSubview(textView)
        
        // 2-2. textView 레이아웃 설정
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: navigation.bottomAnchor, constant: 200),
            textView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            textView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configureTextViewData() {
        // 2-2. ScrollView에 textView의 label, button 추가
        scrollView.addSubview(textViewLabel)
        scrollView.addSubview(textViewButton)
        
        // 2-2. textView label, button 레이아웃 설정
        NSLayoutConstraint.activate([
            textViewButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textViewButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            textViewButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
            textViewButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            textViewLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textViewLabel.topAnchor.constraint(equalTo: textViewButton.bottomAnchor, constant: 20),
            textViewLabel.widthAnchor.constraint(equalTo: textView.widthAnchor),
            textViewLabel.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configureTextField() {
        // 2-3. ScrollView에 textField 추가
        scrollView.addSubview(textField)
        
        // 2-3. textField 레이아웃 설정
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -100),
            textField.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 500),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureTextFieldData() {
        // 2-3. ScrollView에 textField의 label, button 추가
        scrollView.addSubview(textFieldLabel)
        scrollView.addSubview(textFieldButton)
        
        // 2-3. textField label, button 레이아웃 설정
        NSLayoutConstraint.activate([
            textFieldButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 20),
            textFieldButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            textFieldButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 500),
            textFieldButton.heightAnchor.constraint(equalToConstant: 30),
            
            textFieldLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textFieldLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            textFieldLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            textFieldLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -200),
            textFieldLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // 1. ModalVC로 보내는 present 생성
    @objc func moveToModalVC() {
        let modalVC = ModalViewController()
        // TransitionStyle, PresentationStyle 수정가능
        modalVC.modalTransitionStyle = .coverVertical
        modalVC.modalPresentationStyle = .pageSheet
        self.present(modalVC, animated: true, completion: nil)
    }
    
    // 1. NaviVC로 보내는 push 생성
    @objc func moveToNaviVC() {
        let naviVC = NaviViewController()
        self.navigationController?.pushViewController(naviVC, animated: true)
    }
    
    // 2-2. textView에 편집을 종료하는 함수
    @objc func didTapTextView() {
        view.endEditing(true)
    }
    
    // 2-2. textViewLabel에 데이터를 전달하는 함수
    @objc func didTapTextViewBtn() {
        textViewLabel.text = textView.text
    }
    
    // 2-3. textFieldLabel에 데이터를 전달하는 함수
    @objc func didTapTextFieldBtn() {
        textFieldLabel.text = textField.text
    }
}

extension ViewController: UITextViewDelegate {
    
    // textView 편집이 시작될때
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetupView()
    }
    
    // textView 편집이 종료될때
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textViewSetupView()
        }
        print("\(textView.text!)")
    }
    
    // textView Placeholder 설정
    func textViewSetupView() {
        if textView.text == "TextView 내용을 입력하세요." {
            textView.text = ""
            textView.textColor = .black
        } else if textView.text == "" {
            textView.text = "TextView 내용을 입력하세요."
            textView.textColor = .lightGray
        }
    }
}
