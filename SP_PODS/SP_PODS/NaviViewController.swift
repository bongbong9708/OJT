//
//  NaviViewController.swift
//  SP_PODS
//
//  Created by 이상봉 on 2021/12/30.
//

import UIKit

class NaviViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }
    
    // 상단의 내비게이션 버튼을 눌러도 되지만
    // 버튼에 IBAction 준 다음 popViewController 메소드를 사용하면 됌
    @IBAction func backToVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   

}
