# OJT
OJT 교육일지

- [iOS 라이프 사이클](https://github.com/bongbong9708/OJT#ios-%EB%9D%BC%EC%9D%B4%ED%94%84-%EC%82%AC%EC%9D%B4%ED%81%B4)
  - [앱 생명주기](https://github.com/bongbong9708/OJT#1-%EC%95%B1-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0app-lifecycle)
  - [뷰컨트롤러 생명주기](https://github.com/bongbong9708/OJT#2-%EB%B7%B0%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0viewcontroller-lifecycle)
- [UI 구성](https://github.com/bongbong9708/OJT/blob/main/README.md#ui-%EA%B5%AC%EC%84%B1)
  - [Interface Builder](https://github.com/bongbong9708/OJT/blob/main/README.md#1-interface-builder)
  - [스토리보드](https://github.com/bongbong9708/OJT/blob/main/README.md#2-storyboard)
    - [XIB](https://github.com/bongbong9708/OJT/blob/main/README.md#xib)
  - [SwiftUI](https://github.com/bongbong9708/OJT/blob/main/README.md#3-swiftui)
    - [SwiftUI vs Interface Builder and Storyboard](https://github.com/bongbong9708/OJT/blob/main/README.md#swiftui-vs-interfacebuilder-and-storyboards)
- 개발 모델
  - [MVC 패턴]
  - [MVVM 패턴]
  - [MVP 패턴]
  - [VIPER 패턴]
  - [VIP 패턴]

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
-----
[앱 생명주기 vs 뷰컨트롤러 생명주기](https://medium.com/ios-development-with-swift/%EC%95%B1-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-app-lifecycle-vs-%EB%B7%B0-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-view-lifecycle-in-ios-336ae00d1855)

[앱의 생명주기와 앱의 구조](https://jinshine.github.io/2018/05/28/iOS/%EC%95%B1%EC%9D%98%20%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0(App%20Life%20Cycle)%EC%99%80%20%EC%95%B1%EC%9D%98%20%EA%B5%AC%EC%A1%B0(App%20Structure)/)

[뷰 컨트롤러 라이프사이클](https://doit-leed.tistory.com/58?category=907317)

------------------------------------------------

## UI 구성 

### 1. Interface Builder
Xcode 내의 Interface Builder 편집기는 코드를 작성하지 않고 전체 사용자 인터페이스를 간단하게 디자인할 수 있도록 해줍니다. 간단하게 윈도우, 단추, 텍스트 필드 및 기타 대상체를 디자인 캔버스로 드래그 앤 드롭하여 작동하는 사용자 인터페이스를 만들 수 있습니다.
 - Cocoa 및 Cocoa Touch가 모델-뷰-컨트롤러 패턴을 사용하여 구축되어 있어 구현과는 별도로 인터페이스를 손쉽게 독립적으로 디자인할 수 있습니다.
 - 사용자 인터페이스는 실제로 Cocoa 또는 Cocoa Touch 대상체(.nib 파일로 저장됨)로 아카이브되며 macOS 및 iOS에서 앱 실행 시 UI와 코드 간에 연결을 동적으로 생성합니다.
![image](https://user-images.githubusercontent.com/88380643/146872811-69a1ec62-dd88-4326-a8d4-b4d7b0c26a8c.png)

### 2. Storyboard
완전한 iOS 앱은 사용자가 탐색하는 여러 뷰로 구성됩니다. 이러한 뷰 간의 관계는 앱의 흐름을 전체적으로 보여주는 스토리보드로 정의 됩니다. Interface Builder의 스토리보드 디자이너는 새로운 뷰를 쉽게 생성 및 설계하고 이러한 뷰를 한데 연결하여 사용자 설정 코드 준비가 완료된 완전한 사용자 인터페이스를 만들 수 있도록 해줍니다.
Storyboard란 앱의 흐름을 나타내며, 시각적으로 화면을 구성하는 곳이며 iOS 앱의 사용자 인터페이스를 시각적으로 표현하여 컨텐츠 화면과 화면 간의 연결을 보여주는 도구입니다. 스토리보드는 일련의 장면(scenes)로 구성되며, 각 scene은 뷰 컨트롤러와 해당 뷰를 나타냅니다.
- Storyboard Controller
  - Table View 컨트롤러
  - Collection View 컨트롤러
  - Search 컨트롤러
  - Tab Bar 컨트롤러
  - Page View 컨트롤러
  - GLKit View 컨트롤러

![image](https://user-images.githubusercontent.com/88380643/146870951-43b310a8-d62f-432a-8392-cb1a8070a0d8.png)

#### XIB
--------
Xcode Interface Builder의 약자로, 화면을 구성하는 클래스 들을 XML문법에 맞춰 저장되고 있습니다. 바이너리로 저장하지 않고 XML형태로 저장하기 때문에 수정된 부분을 알 수 있어서 파일 관리가 아닌 소스코드로 관리로 가능해졌습니다. 직접 수정하려면 XML문법을 맞춰서 수정해야되기 때문에 번거로울 수 있지만, Xcode에서는 Interface Builder를 제공하여 XML 형태가 아닌 그래픽 형태로 수정할 수 있습니다.
- ViewController를 xib로 사용할 때의 장점
  - xib는 재사용이 쉽지만, storyboard에 있는 ViewController를 재사용하려면 어렵습니다.
  - ViewController의 객체를 얻기가 쉽습니다. (storyboard를 이용하면 storyboard객체를 통해 ViewController 객체를 얻지만 xib는 nib 이름만 있으면 가능합니다.)  

- XIB 사용법
1. xib 파일 생성하기 

![image](https://user-images.githubusercontent.com/88380643/146859427-91c6ad03-87be-4c2c-a1a1-e5441665eb8b.png)

2. 원하는 작업을 진행하고 identifier 설정하기

![image](https://user-images.githubusercontent.com/88380643/146859236-42c82ffc-295a-41e2-9fd0-706a3965dcd3.png)

3. IBOutlet 연결하기

![image](https://user-images.githubusercontent.com/88380643/146859766-3502f654-2777-4520-8d19-38c4ccd2fb34.png)

4. ViewController의 viewDidLoad에서 xib 셀을 등록하기

![image](https://user-images.githubusercontent.com/88380643/146859932-edc49562-54a2-424c-a5b7-0c8685c385f4.png)

5. 원하는 형식으로 표현하기

![image](https://user-images.githubusercontent.com/88380643/146860597-07c5c2e5-88af-45ad-b721-0621dd086b02.png)



### 3. SwiftUI
SwiftUI는 최소한의 코드만으로 Swift의 성능을 사용하여 모든 Apple 플랫폼에서 사용할 수 있는 멋진 앱을 만들 수 있도록 도와주고 어떤 Apple 기기에서나 단 하나의 도구 및 API 세트를 사용할 수 있습니다.

![image](https://user-images.githubusercontent.com/88380643/146854103-6a49286c-cb01-4967-ae12-545ea7379e1a.png)
- SwiftUI의 새로운 기능
  - 고급 앱 경험 및 도구
    - 향상된 리스트 뷰, 더 나은 검색 경험, 포커스 영역 제어에 대한 지원 등 새로운 기능을 사용하여 앱을 개선
    - drawRect와 동등한 수준의 최신 GPU가 가속화된 새로운 Canvas API를 통해 더 낮은 수준의 드로잉 프리미티브를 더 강하게 제어
  - 향상된 손쉬운 사용
    - 새로운 Rotor API를 사용하여 화면에 가장 관련성이 높은 항목을 간단한 목록으로 노출하여 상호 작용을 가속화
    - VoiceOver 커서와 같은 손쉬운 사용의 현재 집중 상태를 읽을 수 있으며, 프로그래매틱한 방식으로 변경 가능
    - 새로운 Accessibility Representation API를 사용하면 기존의 표준 SwiftUI 컨트롤의 손쉬운 사용 지원 전체를 맞춤형 컨트롤로 손쉽게 가져올 수 있음 
  - macOS에서 향상된 SwiftUI
    - 다중 열 표에 대한 지원 등 새로운 성능 및 사용 가능한 API가 많아지면서 macOS 앱의 기능이 향상됌 
  - 상시표시형 Retina 디스플레이
    - Apple Wathch Serie 5 이후 모델에는 상시표시형 Retina 디스플레이 기능이 탑재돼 시계 페이스가 어두워져도 watchOS 앱이 계속 표시되므로 주요 정보를 한눈에 볼 수 있음  
  - iPadOS용 위젯
    - 위젯을 홈화면의 어디에나 배치할 수 있으며, 새로운 엑스트라 라지 위젯 사이즈가 추가되어 위젯 크기가 더 커짐

- 선언적 구문
  - SwiftUI는 선언적 구문을 사용하므로 사용자 인터페이스의 기능을 명시하기만 하면 됩니다.
  - 코드가 어느때보다 간단하고 가독성이 향상되어 시간이 절약되고 유지 관리가 용이합니다.
  - 런타임에서 시스템은 부드러운 움직임을 만들기 위해 필요한 모든 단계를 다루며, 또한 앱의 안정성을 위해 방해 프로세스까지 처리합니다.
  
  ![image](https://user-images.githubusercontent.com/88380643/146853764-666c156e-1708-4814-9db9-6f528dca20c5.png)

- 디자인 도구

Xcode에는 SwiftUI를 사용하여 드래그 앤 드롭만큼 간단하게 인터페이스를 빌드할 수 있는 디자인 도구가 포함되어 있습니다.
디자인 캔버스애서 작업하면 모든 내용이 옆에 표시되는 편집기의 코드와 완벽하게 동기화됩니다.
코드는 입력하는 대로 미리보기로 즉시 확인이 가능하며, 미리보기에서 변경하는 사항은 코드에 즉시 반영됩니다.
Xcode는 변경 사항을 즉시 재컴파일하고 실행중인 앱 버전에 삽입하므로 상시 확인 및 편집이 가능합니다.
![image](https://user-images.githubusercontent.com/88380643/146851009-5953b47b-02a2-4504-8588-746c4aec224a.png)
  - 드래그 앤 드롭
    - 캔버스에서 컨트롤을 드래그하여 사용자 인터페이스 내에서 간단히 구성 요소를 정렬할 수 있습니다.
    - 속성을 클릭하여 열고 서체, 색상, 정렬 및 기타 디자인 옵션을 선택하고, 커서를 움직여 컨트롤을 쉽게 다시 정렬할 수 있습니다. 
    - 시각적인 편집기의 상당 부분은 코드 편집기 내에서도 사용 가능하므로 인터페이스에서 직접 코딩하는 부분을 선호하는 경우에도 속성을 사용하여 각 컨트롤에서 새 수정자를 탐지할 수 있습니다.
    - 라이브러리에서 컨트롤을 드래그하여 디자인 캔버스 또는 코드에 직접 드롭할 수 있습니다.
  - 동적 대체
    - Swift 컴파일러 및 런타임은 Xcode 전체에서 기본 제공되므로 앱을 지속적으로 구축하고 실행할 수 있습니다.
    - 개발자에게 표시되는 디자인 캔버스는 사용자 인터페이스가 아닌 라이브 앱과 유사합니다.
    - Xcode는 Swift의 새 기능인 ‘동적 대체’를 사용하여 직접 라이브 앱에서 편집된 코드를 바꿀 수 있습니다.
  - 미리보기
    - SwiftUI 보기 중 하나 또는 여러 개의 미리보기를 생성하여 샘플 데이터를 얻을 수 있으며 큰 서체, 현지화 또는 다크 모드와 같이 사용자에게 모든 항목을 구성할 수 있습니다.
    - 미리보기에서는 UI를 원하는 기기에서 원하는 방향으로 표시할 수 있습니다.

#### SwiftUI vs InterfaceBuilder and Storyboards
-----
InterfaceBuilder and Storyboards에 대비해 SwiftUI가 얻을 수 있는 이점
- SwiftUI는 동시에 두 가지를 제공하기 때문에 더 이상 프로그래밍 방식 또는 스토리보드 기반 디자인에 대해 논쟁할 필요가 없습니다.
- 코드가 스토리보드 XML보다 훨씬 더 읽기 쉽고 관리하기 쉽기 때문에 사용자 인터페이스 작업을 커밋할 때 소스 제어 문제를 생성하는 것에 대해 더 이상 걱정할 필요가 없습니다.
- 문자열 형식의 API에 대해 더 이상 걱정할 필요가 없습니다. 일부는 있지만 훨씬 적습니다. 
- 더 이상 존재하지 않는 함수를 호출하는 것에 대해 걱정할 필요가 없습니다. 사용자 인터페이스가 Swift 컴파일러에 의해 확인되기 때문입니다.

[출처]
-
[Interface Builder](https://developer.apple.com/kr/xcode/interface-builder/)

[스토리보드를 통한 기본 화면 구성](https://scshim.tistory.com/29)

[xib로 ViewController 만들기](https://ios-development.tistory.com/387)

[xib 기본 사용법](https://velog.io/@kimin/xib-%EA%B8%B0%EB%B3%B8%EC%82%AC%EC%9A%A9%EB%B2%95)

[SwiftUI](https://developer.apple.com/kr/xcode/swiftui/)

[SwiftUI vs Interface Builder and storyboards](https://www.hackingwithswift.com/quick-start/swiftui/swiftui-vs-interface-builder-and-storyboards)

-----------------------------------------------------------------------

## 개발 모델

### 1. MVC Pattern
![01](https://user-images.githubusercontent.com/88380643/147016094-6ccd0355-564a-4bd3-880d-c2d6b7c4bac1.png)

Controller가 다리 역할이 되어 View의 입력을 Model에 반영하고 Model의 변화에 맞게 View를 갱신합니다.

- 역할
  - Model : 프로그램에서 사용되는 실제 데이터 및 데이터 조작 로직을 처리하는 부분
  - View : 사용자에게 제공되어 보여지는 UI
  - Controller : 사용자의 압력을 받고 처리하는 부분

- 동작원리
  1. Controller로 사용자의 입력이 들어옵니다.
  2. Controller는 Model을 데이터 업데이트 및 불러옵니다.
  3. Model은 해당 데이터를 보여줄 View를 선택해서 화면에 보여주게 됩니다.

![2](https://user-images.githubusercontent.com/88380643/147017456-a29dbc8e-5216-4da3-be20-770a647b980a.png)

하지만 Apple에서의 MVC 작동 원리는 다르게 작동합니다. View와 Controller가 강하게 연결되어 있기 때문에 ViewController가 거의 모든 일을 하게 되어 있고, 그래서 Model만 따로 놀게 됩니다.

- 장점
  - 다른 패턴에 비해 코드량이 적고 설계가 단순하기 때문에 가장 쉽고 빠르게 개발이 가능합니다.
  - 애플에서 MVC를 지향하고 있기 때문에 기본 LifeCycle에 맞는 개발이 가능합니다.

- 단점
  - View와 Controller가 붙어 있으며, Controller가 View의 Life Cycle까지 관리하기 때문에 View와 Controller를 분리하기 어렵다. 
  - Controller의 역할이 방대해져서 모듈화하는 부분이 무의미해질 수 있습니다.(Massive View Controller)
  - 대규모 프로젝트에는 방대해지기 때문에 비적합합니다

### 2. MVVM Pattern
![3](https://user-images.githubusercontent.com/88380643/147018226-337c3bbf-ab8a-4297-8da8-dbf7477cc01d.png)

Controller를 빼고 ViewModel을 추가한 패턴입니다.

- 역할
  - View
    - iOS는 ViewController까지 View가 됩니다.
    - 사용자가 보여지는 View
    - 유저인터렉션을 받는 역할, 인터렉션ㅇㄹ 받을 시 ViewModel에게 명령을 내립니다.
  - ViewModel
    - View를 표현하기 위해 만들어진 View를 위한 Model
    - View와는 Binding을 연결 후 View의 액션을 받고 View를 업데이트 합니다.
    - textView에 보여줄 내용을 담당하는 함수 등 View에서 변화가 일어나는 ViewController의 역할을 담당한다.
  - Model
    - 데이터, 비즈니스 논리, 서비스 클라이언트 구성 
    - 실제적 데이터 입니다.

- 동작원리
  1. View에 입력이 들어오면 ViewModel에 명령을 합니다.
  2. ViewModel은 필요한 데이터를 Model에 요청합니다.
  3. Model은 ViewModel에 필요한 데이터를 응답합니다.
  4. ViewModel은 응답 받은 데이터를 가공해서 저장합니다.
  5. View는 ViewModel과의 DataBinding으로 인해 자동으로 갱신됩니다.

UIImage 혹은 View에 값을 수정하는 것을 ViewModel에서 하면 안됩니다. 혹은 View의 lifecycle에 의존적이거나, View를 레퍼런스로 받아 뷰의 값을 직접 변경하는 일도 UI와 관련된 것으로 간주합니다.

- 장점
  - View와 Model이 서로 전혀 알지 못하기에 독립성을 유지할 수 있다.
  - 독립성을 유지하기 때문에 효율적인 유닛테스트가 가능하다.
  - View와 ViewModel을 바인딩하기 때문에 코드의 양이 작다.
  - View와 ViewModel의 관계는 N:1이다.
  - ViewModel에는 UIKit 관련 코드가 없고 Controller와의 의존성도 없기 때문에 Unittest하기 편하다.
  
- 단점
  - 단순한 프로젝트를 개발하기에는 MVC에 비해서는 시간이 오래걸린다.
  - 간단한 UI에서 오히려 ViewModel 을 설계하는 어려움이 있을 수 있다.
  - 데이터 바인딩이 필수적으로 요구된다. 다양한 바인딩이 가능하다.
  - 복잡해질수록 Controller처럼 ViewModel이 빠르게 비대해진다.
  - 표준화된 틀이 존재하지 않아 사람마다 이해가 다르다.

- DataBinding
  - Model과 UI요소 간의 싱크를 맞춰주는 것
  - 이 패턴을 통해 View와 로직이 분리되어 있어도 한 쪽이 바뀌면 다른 쪽도 업데이트가 이루어져 데이터의 일관성을 유지할 수 있다.
  - iOS에서 데이터 바인딩을 하는 방법
    - KVO
    - Delegation
    - Functional Reactive Programming
    - Property Observer  

### 3. MVP Pattern
![4](https://user-images.githubusercontent.com/88380643/147022166-2cecc1c6-156f-4898-beba-1bca90052777.png)

View와 Model의 의존성을 없애기 위해서 Present를 존재하게 하기 위해 MVC에서 Controller를 제거하고 Presenter를 구성했습니다.

- 역할
  - Model
    - 프로그램에서 사용되는 실제 데이터 및 데이터 조작 로직을 처리하는 부분
    - domain Data 또는 데이터를 다루는 data access layer를 담당하는 카테고리
  - View
    - 사용자에게 제공되어 보여지는 UI
  - Presenter
    - View에서 요청한 정보를 Model로부터 가공해서 View로 전달하는 부분
    - Presenter에서 어떠한 layout code도 담겨져 있지 않다.
    - View의 데이터와 상태를 Updating 해주는 역할을 맡았다.

- 동작원리
  1. View로 사용자의 입력이 들어옵니다.
  2. View는 Presenter에 작업을 요청합니다.
  3. Presenter에서 필요한 데이터는 Model에 요청합니다.
  4. Model은 Presenter에 필요한 데이터를 응답합니다.
  5. Presenter는 View에 데이터를 응답합니다.
  6. View는 Present로부터 받은 데이터로 화면에 보여줍니다.

- 장점
  - 대부분의 책임을 Presenter와 Model이 가지고 있어 View는 출력만 하는 역할을 한다.
  - Test할 때 View에 대한 책임이 분리되어 있기에 각 요소들을 독립적으로 테스트할 수 있다.
  - MVC보다 각 요소들의 역할이 명확해졌다.

- 단점
  - View와 Presenter가 1:1 관계이다.
  - MVC에 비해서는 코드가 더 많이 늘어나 진다.

### 4. VIPER Pattern
![5](https://user-images.githubusercontent.com/88380643/147023656-b3ab1e62-0750-4616-a51e-f1619f38db74.png)

MV(X)의 패턴을 대체하기 위해 만들어진 패턴입니다.

- 역할 
  - View
    - 사용자가 보여지는 View. 유저인터렉션을 받는 역할입니다.
    - 이벤트 발생시 Presenter에 해당 일을 전달합니다.
    - Present의 요청대로 디스플레이하고 사용자 입력을 Presenter로 보내는 작업을 합니다.
  - Presenter
    - Entity로 부터 받은 업데이트 이벤트를 실행하지만 데이터를 직접보내지는 않는다.
    - View 모델의 변경사항을 Interactor에 알린다.
    - 언제의 타이밍을 아는 존재
    - Interactor로 부터 데이터를 가져오고 View로 보내기 위해 데이터를 준비하여 언제 View를 보여줄지 결정합니다.
  - Interactor
    - Presenter로 부터 받은 모델 변경사항에 따라 Entity에 접속하여 Entity로 부터 수신한 데이터를 Presenter로 전달합니다. 
    - Use Case에 따라서 Entity 모델 객체를 조작하는 로직을 담았습니다.
  - Entity
    - 객체에 구성된 부분을 Interactor에 의해 제어합니다.
    - 순수 모델 객체 입니다.
  - Routing
    - Wireframe이라고 불리기도 하고, UIWindow와 UINavigationController에서 화면간의 탐색을 위한 라우팅을 담당한다.
    - 화면 전환을 담한다.(Presenter는 언제 화면이 전환이라면 Router는 어떻게 하는지 담당한다.)

- 장점
  - 각 도메인의 역할이 명확하게 구분됩니다.
  - 모듈을 작게 역할을 분명히 하기에 대규모 프로젝트에 적합합니다.

- 단점
  - 설계가 여러 곳으로 난립합니다.
  - 명확한 가이드나 유지보수 되는 곳이 없습니다.
  - 많은 파일들을 생성합니다.

### 5. VIP Pattern
![6](https://user-images.githubusercontent.com/88380643/147033873-63d71527-78be-4ff7-8bcd-1b9380f2cc0c.png)

VIP패턴은 VIPER 패턴과 디렉토리와 생성되는 클래스는 동일하지만 플로우를 다른 관점에서 보는 아키텍처
VIPER는 위의 그림처럼 양방향으로 로직이 순환해서 순환참조에 의한 메모리 누수가 날 수 있고, 또한 하나의 액션의 기대 결과값을 의해 각 클래스의 프로토콜에 메소드를 만들어야하지만 
VIP는 닫는 방향으로 로직이 순환해서 액션에 대한 결과값을 보여주는 형태이다.

- 역할
  - View
    - 스토리보드, XiB와 같은 사용자와 상호작용이 발생하는 인터페이스
  - Controller
    - View를 코드에 바인딩하는 레이어
  - Interactor
    - Controller의 요청을 보내야하는 비지니스 로직 계층
  - Presenter
    - Interactor로 부터 받은 형태를 View에 맞게 전달할 수 있게 Controller에게 전달
  - Router
    - Controller에서 발생한 이벤트를 다른 user case에 전달하는 역할

- 동작원리
  1. View가 사용자의 인터페이스를 만듭니다.
  2. Controller에서 이벤트가 발생하여 모델을 요청 후 Interactor를 호출합니다.
  3. Interactor에서는 기본 코어 라이브러리를 호출하여 데이터를 액세스합니다.
  4. Interactor에서 비지니스로직을 처리하고 결과를 다시 Presenter로 보냅니다.
  5. Presenter에서 Interactor에서 받은 결과에 대한 UI처리를 Controller에 전달하고 View에서 보여줌
VIPER와 다르게 액션에 대한 비지니스 로직을 Presneter를 통하지 않고 Interactor를 요청하여 변화를 주어 단방향으로 플로우가 진행된다.

- 장점
  - 컴포넌트가 단단히 연결되어 있지 않아 유연하고, 확장가능하며, 유지관리가 가능하다.
  - 프로토콜로 서로 참조합니다.
  - 모든 layer가 인터페이스로 되어 있기에 테스트에 용이합니다.

- 단점
  - layer끼리 전달할 때 request/response 모델을 랩핑해야하는 불편함이 존재한다.
  - 모델을 랩핑하지 않으면 컴포넌트가 결합될 수 있다.
  - 비동기 액션에 대한 처리가 별도로 필요합니다.


[출처]
-
[iOS Architecture Patterns](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52)

[MVP, MVVM, MVP, VIPER, VIP를 알아봅시다.](https://dev-leeyang.tistory.com/21)

[MVC 패턴에 대해 알아보자](https://velog.io/@zooneon/iOS-MVC-패턴에-대해-알아보자)

[MVVM패턴? 어떤 장점이 있을까?](https://velog.io/@sso0022/iOS-MVC-와-MVVM)

[MVP](https://jiyeonlab.tistory.com/37?category=818842)

[iOS 아키텍처 패턴 VIPER](https://bugle.tistory.com/48)
