//
//  DispatchViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/07.
//

import UIKit

class DispatchViewController: UIViewController {

    /*
     Dispatch
     디스패치: 시스템에서 관리하는 디스패치 대기열에 작업을 제출하여 멀티코어 하드웨어에서 동시에 코드를 실행합니다.
     1. DispatchQueue : 큐에 담긴 각 아이템은 스레드 풀에 의해 처리됩니다.
        - main: Main Thread에서 처리되는 Serial queue(모든 UI작업은 Main Queue에서 수행되어야 함
          global: 전체 시스템에 공유되는 concurent queue
          custom: serial queue를 만들고 싶을 때 사용, global queque에서 실행
        - Serial: 이전 작업이 끝나면 다음 작업이 순차적으로 진행
          Concurrent 병렬형태로 진행
        - sync: Queue에 집어넣은 데이터들이 끝날 때까지 코드진행을 멈춤
          async: queue에 집어넣은 데이터들이 끝나지 않아도 코드진행
        - asyncAfter: 시간을 주고 그 시간 후에 해당 작업을 하라는 의미
     
     ex)
     DispatchQueue.main.async { }   // main, async
     DispatchQueue.global().sync { }    // global, sync
     DispatchQueue(label: "myQueue").async { }  // serial, custom

     // cuncurrent
     DispatchQueue(label: "myQueue"), qos: .default, attributes: .concurrent, autoreleaseFrequencyL .inherit, target: nil).async { }
     DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { }  // asyncAfter
    
     2. QoS(Quality of Service): 작업시 중요도의 우선순위에 따라 처리, 어떤 작업을 Multi-threading으로 concurrent하게 처리하고자 할 때 사용
        - userInteractive: 유저 입장에서 가장 빠른 결과를 기대 - 유저가 버튼을 tap할 시 바로 작동, global queue이지만 main thread에서 실행
        - userInitiated: 유저 입장에서 조금 빠른 결과를 기대 - Async하게 처리
        - Default: background에서 실행
        - utility: 유저 입장에서 기다리는 정도의 기대 - 계산, I/O, N/W
        - background: 유저 입장에서 실행되는지 몰라도 되는 정도의 바로 필요하지 않은 기대
     
     ex)
     
     DispatchQueue.global(qos: .userInteractive).async {
         let img = self.getImg()
                 
         // UI관련 작업이므로 main queue에서
         DispatchQueue.main.async{
             self.imgView.image = img
         }
      
     }
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Dispatch"
        // Do any additional setup after loading the view.
    }
    
}
