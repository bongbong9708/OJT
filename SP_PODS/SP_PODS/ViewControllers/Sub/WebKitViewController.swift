//
//  WebKitViewController.swift
//  SP_PODS
//
//  Created by 이상봉 on 2022/01/05.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    @IBOutlet weak var webKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WebKitView"
        
        loadUrl()
        
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
}
