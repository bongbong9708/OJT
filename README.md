# OJT
OJT 교육일지

- [iOS 라이프 사이클](https://github.com/bongbong9708/OJT#ios-%EB%9D%BC%EC%9D%B4%ED%94%84-%EC%82%AC%EC%9D%B4%ED%81%B4)
  - [앱 생명주기](https://github.com/bongbong9708/OJT#1-%EC%95%B1-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0app-lifecycle)
  - [뷰컨트롤러 생명주기](https://github.com/bongbong9708/OJT#2-%EB%B7%B0%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0viewcontroller-lifecycle)
- UI 구성
- 모델

## iOS 라이프 사이클

### 1. 앱 생명주기(APP Lifecycle)

- Application이 실행하고 종료될때까지의 흐름
  - 앱 실행 중 화면에 보이지 않는 background 상태
  - 화면 위에 올라있는 foreground 상태

- 앱 실행과정
  1. main 함수를 실행한다.
  2. main 함수는 UIApplicationMain 함수를 호출한다
  3. UIApplicationMain 함수는 앱의 본체에 해당하는 객체인 UIApplication 객체를 생성한다.
  4. nib파일을 사용하는 경우나 info.plist 파일을 읽어 들여 파일에 기록된 정보를 참고하여 그 외에 필요한 데이터를 로드한다.
  5. 앱 엘리베이터 객체를 만들고 앱 객체와 연결하고 런루프를 만드는 등 실행에 필요한 준비를 한다.
  6. 실행 완료를 앞두고 앱 객체가 앱 델리게이트에게 application:didFinishLaunchingWithOptions: 메시지를 보낸다.
  
- 앱 상태(App State)

![AppState](https://user-images.githubusercontent.com/88380643/146733328-ac47877c-58b8-4cfd-8ede-a220d0abb4de.png)

  - Not Running : 실행되지 않았거나, 시스템에 의해 종료된 상태
  - Inactive : 실행 중이지만 이벤트를 받고있지 않은 상태
  - Active : 어플리케이션이 실질적으로 활동하고 있는 상태
  - Background : 백그라운드 상태에서 실질적인 동작을 하고 있는 상태
  - Suspended : 백그라운드 상태에서 활동을 멈춘 상태
  
대부분의 상태 전환은 AppDelegate객체의 메소드 호출을 거칩니다. AppDelegate 객체는 UIResponder, UIApplicationDelegate를 상속 및 델리게이트를 참조하고 있습니다.
UIApplicationDelegate은 UIApplication 객체의 작업에 개발자가 접근할 수 있도록 하는 메소드들을 담고 있습니다. 

- AppDelegate
  - application:willFinishLaunchingWithOptions: 어플리케이션이 최초 실행될 때 호출되는 메소드
  - application:didFinishLaunchingWithOptions: 어플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출
  - applicationDidBecomeActive: 어플리케이션이 Active 상태로 전환된 직후 호출
  - applicationWillResignActive: 어플리케이션이 Inactive 상태로 전환되기 직전에 호출
  - applicationDidEnterBackground: 어플리케이션이 백그라운드 상태로 전환된 직후 호출
  - applicationWillEnterForeground: 어플리케이션이 Active 상태가 되기 직전에, 화면에 보여지기 직전의 시점에 호출
  - applicationWillTerminate: 어플리케이션이 종료되기 직전에 호출
  
- 앱을 Foreground로 실행하기

앱이 시작되는 부분에서 시스템은 프로세스와 앱의 Main Thread, 그리고 Main Thread에서 main함수를 생성합니다.
main함수에서 UIKit 프레임워크를 즉시 다룰 수 있고, UIKit 프레임 워크는 앱의 초기화와 실행준비를 합니다.

![foreground](https://user-images.githubusercontent.com/88380643/146734182-4f85ed85-29f8-4ab6-8012-ab238b376bf8.png)

- 앱을 Background로 실행하기

![background](https://user-images.githubusercontent.com/88380643/146734189-484e1dc8-c81a-4f1a-b038-ed8d072013c2.png)

### 2. 뷰컨트롤러 생명주기(ViewController Lifecycle) 
모바일 앱은 화면의 크기가 작아서 PC와 달리 하나의 화면에 하나의 ViewController만 가집니다. 그리고 여러개의 ViewController가 모여 하나의 앱을 만듭니다. 
iOS에서 한 화면에서 다른 화면으로 전환할 때 기존의 화면 위에 새로운 화면으로 쌓이는 식으로 화면을 전환합니다. 이 때 각각의 뷰 컨트롤러는 자신만의 생명주기를 가지고 있고 이 생명주기를 잘 이해하고 있다면 뷰 컨트롤러의 상황에 따라 원하는 로직을 수행하도록 만들 수 있습니다.

![lifecycle](https://user-images.githubusercontent.com/88380643/146723731-af4d6469-b68e-4b67-a313-096ba8550d5c.png)

- viewDidLoad()
  - 뷰 계층이 메모리에 로드된 직후 호출
  - 일반적으로, content view가 처음 생성될 때만 호출
  
- viewWillAppear()
  - viewController의 content view가 뷰 계층에 추가되기 직전(화면에 보여지기 시작하면서)에 호출
  - 화면에 표시되기 전에 발생해야 하는 작업 실행
  - iOS 13 이전에는 다시 보일때마다 호출이 되었지만 13 이후로는 한번만 호출
  
- viewDidAppear()
  - viewController의 content view가 뷰 계층에 추가된 직후(화면에 완전히 보여지고 난 후)에 호출
  - 데이터를 가져오거나 애니메이션처럼 뷰가 화면에 나타난 즉시 발생해야 하는 작업

- viewWillDisappear()
  - viewController의 content view가 뷰 계층에 제거되기 직전(화면에 사라지기 시작하면서)에 호출(다음 뷰 컨트롤러의 전환이 발생하고 원본 뷰 컨트롤러가 화면에서 제거되기 전)
  - 일반적으로 이 시점에서 수행해야 하는 작업이 거의 없음
  - 뷰가 생성된 뒤 발생한 변화를 이전 상태로 되돌리기 좋은 시점

- viewDidDisappear()
  - viewController의 content view가 뷰 계층에 제거된 직후(화면에서 완전히 사라지고 난 후)에 호출
  - 시간이 오래 걸리는 작업은 하지 않는 것이 좋음
  
[출처] 

[앱 생명주기 vs 뷰컨트롤러 생명주기](https://medium.com/ios-development-with-swift/%EC%95%B1-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-app-lifecycle-vs-%EB%B7%B0-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-view-lifecycle-in-ios-336ae00d1855)

[앱의 생명주기와 앱의 구조](https://jinshine.github.io/2018/05/28/iOS/%EC%95%B1%EC%9D%98%20%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0(App%20Life%20Cycle)%EC%99%80%20%EC%95%B1%EC%9D%98%20%EA%B5%AC%EC%A1%B0(App%20Structure)/)

[뷰 컨트롤러 라이프사이클](https://doit-leed.tistory.com/58?category=907317)
