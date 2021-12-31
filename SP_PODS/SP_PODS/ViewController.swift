//
//  ViewController.swift
//  SP_PODS
//
//  Created by 이상봉 on 2021/12/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }

    // 스토리보드로로 Modal 화면 전환하기
    /*
     1. 두번째 VC 생성
     2. 첫번째 VC에 버튼 생성
     3. 버튼을 Control + 드래그로 두번째 VC에 끌어준 다음 Present modally 선택
     */
    
    // 코드로 Modal 화면 전환하기
    /*
     1. 두번째 VC 생성
     2. 첫번째 VC에 버튼 생성 후 IBAction 연결
     3. 두번째 VC 스토리보드ID 지정
     4. button IBAction 코드 부분 작성(present)
     5. 실행 후 확인
     6. 두번째 VC도 버튼 생성 후 IBAction 코드 작성(dismiss)
     */

    @IBAction func moveToModalVC(_ sender: Any) {
//        guard let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modalVC") as? ModalViewController else {
//            return
//        }
//
//        self.present(modalVC, animated: true, completion: nil)
    }
    
    
    // 스토리보드로 Navigation 화면 전환하기
    /*
     1. Embed in으로 내비게이션으로 생성 후
     2. 첫번째 VC에 버튼 생성
     3. 버튼을 Control + 드래그로 두번째 VC에 끌어준 다음 show 선택
     4. 실행 후 확인
     */
    
    // 코드로 Navigation 화면 전환하기
    /*
     1. Embed in으로 내비게이션으로 생성 후
     2. 첫번째 VC에 버튼 생성 후 IBAction 연결
     3. 두번째 VC 스토리보드ID 지정
     4. button IBAction 코드 부분 작성(pushViewController)
     5. 실행 후 확인
     6. 두번째 VC도 버튼 생성 후 IBAction 코드 작성(popViewController)
     */
    @IBAction func moveToNaviVC(_ sender: Any) {
//        guard let naviVC = self.storyboard?.instantiateViewController(withIdentifier: "naviVC") as? NaviViewController else {
//            return
//        }
//
//        self.navigationController?.pushViewController(naviVC, animated: true)
    }
    
}

