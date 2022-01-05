//
//  ModalViewController.swift
//  SP_PODS
//
//  Created by 이상봉 on 2021/12/30.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }
    
    // 버튼에 IBAction 준 다음 dismiss 메소드를 사용하면 됌
    @IBAction func backToVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
