//
//  WebKitViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/04.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    // 3-2. WebKitView 생성
    let webKitView: WKWebView = {
        let webkit = WKWebView()
        webkit.translatesAutoresizingMaskIntoConstraints = false
        return webkit
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "WebKitView"
        
        loadUrl()
        configureWebKitView()
        
        // 스와이프를 통해 뒤로가기, 앞으로가기를 할 수 있게 해주는 설정값
        webKitView.allowsBackForwardNavigationGestures = true
    }
    
    func loadUrl() {
        if let url = URL(string: "https://www.naver.com") {
            let urlRequest = URLRequest(url: url)
            webKitView.load(urlRequest)
        } else {
            // 에러가 발생할 시
            print("에러발생")
        }
    }
    
    func configureWebKitView() {
        // view에 webKitView 추가
        view.addSubview(webKitView)
        
        // webKitView 레이아웃 설정
        NSLayoutConstraint.activate([
            webKitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webKitView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webKitView.topAnchor.constraint(equalTo: view.topAnchor),
            webKitView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

}
