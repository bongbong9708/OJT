//
//  ViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2021/12/30.
//

import UIKit
import SnapKit
import SDWebImage

class ViewController: UIViewController {
    
    /*
     1. SnapKit 도입 후
        .translatesAuthoresizingMaskIntoConstraints = false 삭제 및
     NSLayoutConstraint.activate([ ]) 주석처리
     
     2. imageView에 아래에 sdImageView 추가
     */
    
    
    // 1. Modal 버튼 생성 - Present & Dismiss
    let modal: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        // 버튼의 레이아웃을 코드로 직접 수정 가능하도록 설정
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToModalVC), for: .touchUpInside)
        return button
    }()
    
    // 1. Navigation 버튼 생성 - Push & Pop
    let navigation: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToNaviVC), for: .touchUpInside)
        return button
    }()
    
    // 2-1. 스크롤 뷰 생성
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
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
        return label
    }()
    
    // 2-3. 버튼을 누르면 텍스트필드의 데이터를 라벨에 전달
    let textFieldButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Btn", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(didTapTextFieldBtn), for: .touchUpInside)
        return btn
    }()
    
    // 3-1. imageView 생성
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "상봉.png")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()
    
    // 3-1. SdWebImage로 imageView 생성
    let sdImageView: UIImageView = {
        let image = UIImageView()
        image.sd_setImage(with: URL(string: Data().sdImage), placeholderImage: UIImage(named: "person"))
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()
        
    // 3-2. WebKitViewController로 가는 버튼 생성
    let webKitBtn: UIButton = {
        let button = UIButton()
        button.setTitle("WebKit View", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToWebKitVC), for: .touchUpInside)
        return button
    }()
    
    // 3-3. MapKitViewController로 가는 버튼 생성
    let mapKitBtn: UIButton = {
        let button = UIButton()
        button.setTitle("MapKit View", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToMapKitVC), for: .touchUpInside)
        return button
    }()
    
    // 4-1. CollectionViewController로 가는 버튼 생성
    let collectionViewBtn: UIButton = {
        let button = UIButton()
        button.setTitle("CollectionView", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToCollectionVC), for: .touchUpInside)
        return button
    }()
    
    // 4-2. TableViewController로 가는 버튼 생성
    let tableViewBtn: UIButton = {
        let button = UIButton()
        button.setTitle("TableView", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToTableVC), for: .touchUpInside)
        return button
    }()
    
    // 5-1. DispatchVC로 가는 버튼 생성
    let dispatchBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Dispatch", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToDispatchVC), for: .touchUpInside)
        return button
    }()
    
    // 5-2. DelegateVC로 가는 버튼 생성
    let delegateBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Delegate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToDelegateVC), for: .touchUpInside)
        return button
    }()
    
    // 5-3. Notification 실습하는 버튼 생성
    let notiBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Notification", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(moveToNotiVC), for: .touchUpInside)
        return button
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "OJT-UIKitCode"
        
        view.backgroundColor = .systemBackground
        
        // 서브뷰 순서에 때문에 에러가 발생하여 순서를 알맞게 수정
        configureScrollView()       // 2-1. 스크롤 뷰
        
        configureModalBtn()         // 1-1. 모달
        configureNaviBtn()          // 1-2. 네비게이션
        
        textView.delegate = self
        
        configureTextView()         // 2-2. 텍스트뷰
        configureTextViewData()     // 텍스트뷰 데이터
        
        configureTextField()        // 2-3. 텍스트 필드
        configureTextFieldData()    // 텍스트 필드 데이터
        
        configureImageView()        // 3-1. 이미지뷰
        configureSdImageView()
        configureWebkitBtn()        // 3-2. 웹킷뷰
        configureMapkitBtn()        // 3-3. 맵킷뷰
        
        configureCollectionBtn()    // 4-1. 컬렉션뷰
        configureTableBtn()         // 4-2. 테이블뷰
        
        configureDispatchBtn()         // 5-1. 디스패치
        configureDelegateBtn()         // 5-2. 델리게이트
        configureNotiBtn()          // 5-3. 노티피케이션
        
        // 다른 view를 tap하면 editing 종료
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView))
        view.addGestureRecognizer(tapGesture)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - 서브뷰 추가 및 레이아웃 설정
    
    func configureScrollView() {
        // 2-1.뷰에 scrollView 서브뷰 추가
        view.addSubview(scrollView)
        
        // 2-1. 스크롤뷰 제약조건 추가
//        NSLayoutConstraint.activate([
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
//        ])
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
    }

    func configureModalBtn() {
        // 2-1. ScrollView에 모달 버튼 추가
        scrollView.addSubview(modal)
        
        // 2-1. modal 버튼 레이아웃 설정
//        NSLayoutConstraint.activate([
//            modal.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200),
//            modal.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            modal.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
//        ])
        
        modal.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureNaviBtn() {
        // 2-1. ScrollView에 내비게이션 버튼 추가
        scrollView.addSubview(navigation)
        
        // 2-1. navigation 버튼 레이아웃 설정
//        NSLayoutConstraint.activate([
//            navigation.topAnchor.constraint(equalTo: modal.bottomAnchor, constant: 50),
//            navigation.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            navigation.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
//        ])
        navigation.snp.makeConstraints { make in
            make.top.equalTo(modal.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureTextView() {
        // 2-2. ScrollView에 textView 추가
        scrollView.addSubview(textView)
        
        // 2-2. textView 레이아웃 설정
//        NSLayoutConstraint.activate([
//            textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            textView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//            textView.topAnchor.constraint(equalTo: navigation.bottomAnchor, constant: 200),
//            textView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
//            textView.heightAnchor.constraint(equalToConstant: 300)
//        ])
        textView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(navigation.snp.bottom).offset(200)
            make.height.equalTo(300)
            make.width.equalTo(scrollView.snp.width).offset(-40)
        }
        
    }
    
    func configureTextViewData() {
        // 2-2. ScrollView에 textView의 label, button 추가
        scrollView.addSubview(textViewButton)
        scrollView.addSubview(textViewLabel)
        
        // 2-2. textView label, button 레이아웃 설정
//        NSLayoutConstraint.activate([
//            textViewButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            textViewButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//            textViewButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20),
//
//            textViewLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            textViewLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//            textViewLabel.topAnchor.constraint(equalTo: textViewButton.bottomAnchor, constant: 20),
//            textViewLabel.heightAnchor.constraint(equalToConstant: 300)
//        ])
        
        textViewButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        textViewLabel.snp.makeConstraints { make in
            make.top.equalTo(textViewButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(300)
        }
    }
    
    func configureTextField() {
        // 2-3. ScrollView에 textField 추가
        scrollView.addSubview(textField)
        
        // 2-3. textField 레이아웃 설정
//        NSLayoutConstraint.activate([
//            textField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            textField.topAnchor.constraint(equalTo: textViewLabel.bottomAnchor, constant: 200),
//            textField.heightAnchor.constraint(equalToConstant: 30)
//        ])
        
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(textViewLabel.snp.bottom).offset(200)
            make.height.equalTo(30)
        }
    }
    
    func configureTextFieldData() {
        // 2-3. ScrollView에 textField의 label, button 추가
        scrollView.addSubview(textFieldButton)
        scrollView.addSubview(textFieldLabel)
        
        // 2-3. textField label, button 레이아웃 설정
//        NSLayoutConstraint.activate([
//            textFieldButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 20),
//            textFieldButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//            textFieldButton.topAnchor.constraint(equalTo: textViewLabel.bottomAnchor, constant: 200),
//            textFieldButton.heightAnchor.constraint(equalToConstant: 30),
//
//            textFieldLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            textFieldLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//            textFieldLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
//            textFieldLabel.heightAnchor.constraint(equalToConstant: 30)
//        ])
        
        textFieldButton.snp.makeConstraints { make in
            make.top.equalTo(textViewLabel.snp.bottom).offset(200)
            make.leading.equalTo(textField.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        textFieldLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
    }
    
    func configureImageView() {
        // 3-1. scrollView에 imageView 추가
        scrollView.addSubview(imageView)
        
        // 3-1. imageView 레이아웃 설정
//        NSLayoutConstraint.activate([
//            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//            imageView.topAnchor.constraint(equalTo: textFieldLabel.bottomAnchor, constant: 200),
//
//            // 사진 비율이 1대1
//            imageView.widthAnchor.constraint(equalTo: textFieldLabel.widthAnchor),
//            imageView.heightAnchor.constraint(equalTo: textFieldLabel.widthAnchor)
//        ])
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(textFieldLabel.snp.bottom).offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(imageView.snp.width)
        }
    }
    
    func configureSdImageView() {
        // 3-1. scrollView에 sdimageView 추가
        scrollView.addSubview(sdImageView)

        sdImageView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(imageView.snp.width)
        }
    }
    
    func configureWebkitBtn() {
        // 3-2. scrollView에 webKitBtn 추가
        scrollView.addSubview(webKitBtn)
        
        // 3-2. webkitBtn 레이아웃 설정
//        NSLayoutConstraint.activate([
//            webKitBtn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
//            webKitBtn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            webKitBtn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
//        ])
        webKitBtn.snp.makeConstraints { make in
            make.top.equalTo(sdImageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureMapkitBtn() {
        // 3-3. scrollView에 mapKitBtn 추가
        scrollView.addSubview(mapKitBtn)
        
        // 3-3. mapkitBtn 레이아웃 설정
//        NSLayoutConstraint.activate([
//            mapKitBtn.topAnchor.constraint(equalTo: webKitBtn.bottomAnchor, constant: 50),
//            mapKitBtn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            mapKitBtn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//        ])
        mapKitBtn.snp.makeConstraints { make in
            make.top.equalTo(webKitBtn.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureCollectionBtn() {
        // 4-1. scollView에 collectionViewBtn 추가
        scrollView.addSubview(collectionViewBtn)
        
        // 4-1. collectionViewBtn 레이아웃 설정
//        NSLayoutConstraint.activate([
//            collectionViewBtn.topAnchor.constraint(equalTo: mapKitBtn.bottomAnchor, constant: 200),
//            collectionViewBtn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            collectionViewBtn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
//        ])
        collectionViewBtn.snp.makeConstraints { make in
            make.top.equalTo(mapKitBtn.snp.bottom).offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureTableBtn() {
        // 4-2. scrollView에 tableViewBtn 추가
        scrollView.addSubview(tableViewBtn)
        
        // 4-2. tableViewBtn 레이아웃 설정
//        NSLayoutConstraint.activate([
//            tableViewBtn.topAnchor.constraint(equalTo: collectionViewBtn.bottomAnchor, constant: 50),
//            tableViewBtn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            tableViewBtn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
////            tableViewBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -200)
//        ])
        tableViewBtn.snp.makeConstraints { make in
            make.top.equalTo(collectionViewBtn.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureDispatchBtn() {
        scrollView.addSubview(dispatchBtn)
        
        dispatchBtn.snp.makeConstraints { make in
            make.top.equalTo(tableViewBtn.snp.bottom).offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureDelegateBtn() {
        scrollView.addSubview(delegateBtn)
        
        delegateBtn.snp.makeConstraints { make in
            make.top.equalTo(dispatchBtn.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureNotiBtn() {
        // 5-3. scrollView에 Notification 추가
        scrollView.addSubview(notiBtn)
        
        // 5-3. notiBtn 레이아웃 설정
//        NSLayoutConstraint.activate([
//            notiBtn.topAnchor.constraint(equalTo: tableViewBtn.bottomAnchor, constant: 200),
//            notiBtn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
//            notiBtn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
//            notiBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -200)
//        ])
        notiBtn.snp.makeConstraints { make in
            make.top.equalTo(delegateBtn.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-200)
        }
    }
    
    // MARK: - objc func 설정
    
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
    
    // 3-2. webKitViewController로 가는 Push 함수 생성
    @objc func moveToWebKitVC() {
        let webKitVC = WebKitViewController()
        self.navigationController?.pushViewController(webKitVC, animated: true)
    }
    
    // 3-3. mapKitViewController로 가는 Push 함수 생성
    @objc func moveToMapKitVC() {
        let mapKitVC = MapKitViewController()
        self.navigationController?.pushViewController(mapKitVC, animated: true)
    }
    
    // 4-1. CollectionViewController로 가는 Push 생성
    @objc func moveToCollectionVC() {
        let collectionVC = CollectionViewController()
        self.navigationController?.pushViewController(collectionVC, animated: true)
    }
    
    // 4-2. TableViewController로 가는 Push 생성
    @objc func moveToTableVC() {
        let tableVC = TableViewController()
        self.navigationController?.pushViewController(tableVC, animated: true)
    }
    
    // 5-1. DispatchViewController로 가는 Push 생성
    @objc func moveToDispatchVC() {
        let dispatchVC = DispatchViewController()
        self.navigationController?.pushViewController(dispatchVC, animated: true)
    }
    
    // 5-2. DelegateViewController로 가는 Push 생성
    @objc func moveToDelegateVC() {
        let delegateVC = DelegateViewController()
        self.navigationController?.pushViewController(delegateVC, animated: true)
    }
    
    // 5-3. NotificationViewController로 가는 Push 생성
    @objc func moveToNotiVC() {
        let notiVC = NotiViewController()
        self.navigationController?.pushViewController(notiVC, animated: true)
    }
}


// MARK: - textView 설정
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
