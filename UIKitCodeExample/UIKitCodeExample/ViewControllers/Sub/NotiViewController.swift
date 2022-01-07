//
//  NotiViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/06.
//

import UIKit
import SnapKit

class NotiViewController: UIViewController {

    // 로컬 푸시(local notification): 앱으로부터 push를 앱에 띄우는 것
    // 서버 푸시(remote notification): 서버로부터 push를 앱에 띄우는 것
    
    // 푸시를 다루는 객체는 UNUserNotificationCenter의 싱글톤 객체 활용
    let userNotiCenter = UNUserNotificationCenter.current()
    
    // 버튼을 누르면 Noti가 나오도록 설정
    let notiBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Dispatch", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(requestNoti), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Notification"
        
        requestAuthNoti()
        configureNoti()
//        requestNoti()
    }
    
    // 사용자에게 알람 권한 요청하는 메소드 추가: UNAuthorizationOptions 객체로 요청
    func requestAuthNoti() {
        let notiAuthOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        userNotiCenter.requestAuthorization(options: notiAuthOptions) { (success, error) in
            if let error = error {
                print(#function, error)
            }
            print(success)
        }
    }
    
    // 노티버튼 레이아웃 설정
    func configureNoti() {
        view.addSubview(notiBtn)
        notiBtn.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    // 버튼을 누르면 2초 뒤에 알람이 보내지게 하는 부분
    @objc func requestNoti() {
        requestSendNoti(seconds: 2)
    }
    
    // 알림을 전송하는 메소드 추가: Content, Trigger, Request 객체를 이용
    func requestSendNoti(seconds: Double) {
        let notiContent = UNMutableNotificationContent()
        notiContent.title = "OJT 코드"
        notiContent.subtitle = "Notification"
        notiContent.body = "UIKit 기초 마지막"
        notiContent.userInfo = ["targetScene": "splash"]    // 푸시 받을 때 오는 데이터
        
        // 알림을 trigger 되는 시간 설정
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notiContent, trigger: trigger)
        
        userNotiCenter.add(request) { (error) in
            print(#function, error)
        }
    }
    
    

}
