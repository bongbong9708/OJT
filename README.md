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
- [개발 모델](https://github.com/bongbong9708/OJT#%EA%B0%9C%EB%B0%9C-%EB%AA%A8%EB%8D%B8)
  - [MVC 패턴](https://github.com/bongbong9708/OJT#1-mvc-pattern)
  - [MVVM 패턴](https://github.com/bongbong9708/OJT#2-mvvm-pattern)
  - [MVP 패턴](https://github.com/bongbong9708/OJT#3-mvp-pattern)
  - [VIPER 패턴](https://github.com/bongbong9708/OJT#4-viper-pattern)
  - [VIP 패턴](https://github.com/bongbong9708/OJT#5-vip-pattern)
- [Swift 기초 1](https://github.com/bongbong9708/OJT#swift-%EA%B8%B0%EC%B4%88-1)
  - [Playground](https://github.com/bongbong9708/OJT#1-playground)
  - [데이터 타입(Safe)](https://github.com/bongbong9708/OJT#2-%EB%8D%B0%EC%9D%B4%ED%84%B0-%ED%83%80%EC%9E%85safe)
  - [Typealias](https://github.com/bongbong9708/OJT#3-typealias)
  - [Tuple](https://github.com/bongbong9708/OJT#4-tuple)
- [Swift 기초 2 (Collection Types)](https://github.com/bongbong9708/OJT/blob/main/README.md#swift-%EA%B8%B0%EC%B4%88-2-collection-types)
  - [배열(Array)](https://github.com/bongbong9708/OJT/blob/main/README.md#1-%EB%B0%B0%EC%97%B4array)
    - [맵(Map)]()
    - [필터(Filter)]()
    - [리듀스(Reduce)]()
  - [Dictionary](https://github.com/bongbong9708/OJT/blob/main/README.md#2-dictionary)
  - [Set](https://github.com/bongbong9708/OJT/blob/main/README.md#3-set)
- [Swift 기초 3]()
  - [열거형]()
  - [연산자]()
  - [접근제어]()

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
  
[Reference] 
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

[Reference]
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


[Reference]
-
[iOS Architecture Patterns](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52)

[MVP, MVVM, MVP, VIPER, VIP를 알아봅시다.](https://dev-leeyang.tistory.com/21)

[MVC 패턴에 대해 알아보자](https://velog.io/@zooneon/iOS-MVC-패턴에-대해-알아보자)

[MVVM패턴? 어떤 장점이 있을까?](https://velog.io/@sso0022/iOS-MVC-와-MVVM)

[MVP](https://jiyeonlab.tistory.com/37?category=818842)

[iOS 아키텍처 패턴 VIPER](https://bugle.tistory.com/48)

-----------------------------------------------------------------------

## Swift 기초 1

### 1. Playground
![image](https://user-images.githubusercontent.com/88380643/147169658-e502ef4e-57ba-4b3a-b3aa-3025dcb3f66e.png)

별도의 프로젝트 생성 없이 스위프트 코드를 실행할 수 있는 스위프트 코딩환경입니다. 기본 문법 연습에서부터 복잡한 코드 테스트까지 다양한 기능을 이용할 수 있습니다.
![image](https://user-images.githubusercontent.com/88380643/147170532-f0786de3-9c09-41f9-bb24-2da5e23e81f8.png)
값이 변경되거나 반복 실행 등의 작업을 하게 되면 과정을 확인할 수 있는 빠른확인 보이기 버튼(Quick Look)이 나타납니다.순서나 결과값을 시각화하여 확인할 수 있습니다.
![image](https://user-images.githubusercontent.com/88380643/147170980-3b99fcda-e881-4fda-a6af-8d9a6d0dffe3.png)
또한 PlaygroundSupport라이브러리의 LiveView를 이용하여 동적인 뷰를 볼 수도 있습니다.

### 2. 데이터 타입(Safe)
Swift는 안정성이 가장 뚜렷하게 나타나는 언어이다. 스위프트의 상수는 코드를 안정되고 깔끔하게 만들 수 있도록 사용된다. 서로 다른 타입끼리의 데이터 교환은 꼭 타입 캐스팅을 거쳐야한다.
``` swift
var greeting = "Hello, playground"

let a = 12

let plus = greeting + String(a)   // 정수형을 문자형으로 형변환하지 않을 시 에러

print(plus)
```
스위프트에서 값 타입의 데이터 교환은 엄밀히 말하면 타입 캐스팅이 아닌, 새로운 인스턴스를 생성하여 할당하는 것입니다.

#### 데이터 타입 안심
-----------------
스위프트는 데이터 타입을 안심하고 사용할 수 있는(Type-Safe) 언어이다. 예를 들어 Int 타입 변수에 할당하려는 값이 Character 타입이라면 컴파일 오류가 발생하게 된다. 이런 오류는 프로그래밍 도중에 눈치채기가 어려워서 컴파일러가 알려주지 않으면 나중에 찾아내기도 쉽지 않습니다. 그렇지만 스위프트는 컴파일 오류로 알려주므로 서로 다른 타입의 값을 할당하는 실수를 줄일 수 있습니다.

#### 타입 추론
------------
스위프트에서 변수나 상수를 선언할 때 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 변수나 상수의 타입을 결정합니다.
``` swift
var name = "SangBong"   // 타입을 지정하지 않았으나 타입 추론을 통해 String 타입으로 선언

name = 100    // name은 타입 추론에 의해 String 타입으로 지정되어 정수를 할당하려고 하면 오류 발생
```



### 3. Typealias
Swift에서 기본으로 제공하는 데이터 타입이든, 사용자가 임의로 만든 데이터 타입이든 이미 존재하는 데이터 타입에 임의로 다른이름(별칭)을 부여 할 수 있습니다. 그런 다음 기본 타입 이름과 이후에 추가한 별칭을 모두 사용할 수 있습니다.
``` swift
typealias MyName = String
var name: MyName = "상봉"
print(name)   // 상봉
```
``` swift
enum FruitType {
  case apple
  case banana
  case orange
}

typealias juiceRecipe = [fruitType : Int]

```

### 4. Tuple
투플은 타입의 이름이 지정되어 있지 않은, 프로그래머 마음대로 만드는 타입입니다. '지정된 데이터의 묶음'이라고 표현할 수 있습니다. 튜플은 타입 이름이 따로 없으므로 일정 타입의 나열만으로 튜플 타입을 생성해줄 수 있다. 튜플의 포함될 데이터의 개수는 자유롭게 정할 수 있다.
``` swift
var person: (String, Int, Double) = ("SangBong", 25, 180.0)

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")    // 이름: SangBong, 나이: 25, 신장: 180.0

// 인덱스를 통해 값을 할당할 수 있습니다.
person.1 = 26
person.2 = 179.2

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")    // 이름: SangBong, 나이: 26, 신장: 179.2
```
간편해 보일 수 있지만, 차후에 다른 프로그래머가 코드를 볼 때 이름 없이 인덱스만으로 각 요소의 데이터가 무엇을 나타내는지 쉽게 파악하기가 어렵기 때문에 각 요소가 어떤 의미가 있는지 유추하기 어렵습니다. 그래서 튜플의 요소마다 이름을 붙여줄 수 있습니다.
``` swift
var person: (name: String, age: Int, height: Double) = ("SangBong", 25, 180.0)

print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")    // 이름: SangBong, 나이: 25, 신장: 180.0

// 요소 이름 및 인덱스를 통해 값을 할당할 수 있습니다.
person.age = 26
person.2 = 179.2

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")    // 이름: SangBong, 나이: 26, 신장: 179.2
```
선언해줄 때마다 긴 튜플 타입을 모두 써야될 상황이 생길 수 있습니다. 이럴 때 타입 별칭을 지정할 수 있습니다.
``` swift
typealias PersonTuple = (name: String, age: Int, height: Double)

let me: PersonTuple = (name: "SangBong", age: 25, height: 180.0)
let you: PersonTuple = (name: "Chae", age: 23, height: 165.7)

print("이름: \(me.name), 나이: \(me.age), 신장: \(me.height)")    // 이름: SangBong, 나이: 25, 신장: 180.0
print("이름: \(you.name), 나이: \(you.age), 신장: \(you.height)")   // 이름: Chae, 나이: 23, 신장: 165.7

```

[Reference]
-
[Playground](https://velog.io/@honeyoung_0117/Playground)

야곰, 스위프트 프로그래밍 3판 SWIFT5, 한빛미디어

-----------------------------------------------------------------------

## Swift 기초 2 (Collection Types)

컬렉션 타입의 변경 - 배열, 딕셔너리, 세트를 변수(var)에 할당하면 이 콜렉션은 변경 가능하고 상수(let)에 할당하면 변경 불가능합니다.

### 1. 배열(Array)
배열은 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입입니다.
- 각기 다른 위치에 같은 값이 들어 갈 수 있습니다.
``` swift
// 배열의 선언과 생성
var names: Array<String> = ["sangbong", "chulsoo", "yunghee"]
var names: [String] = ["sangbong", "chulsoo", "yunghee"]    // 위와 같은 표현 1
var names = ["sangbong", "chulsoo", "yunghee"]              // 위와 같은 표현 2

var emptyArray: [Any] = [Any]()         // Any 데이터를 요소로 갖는 빈 배열을 생성
var emptyArray: [Any] = Array<Any>()    // 위와 같은 표현

var emptyArray: [Any] = []
print(emptyArray.isEmpty)   // true
print(names.count)          // 4
```
``` swift
// 배열의 사용
print(names[0])       // sangbong
names[2] = "jenny"    
print(names[2])       // jenny
print(names[3])       // 인덱스 범위를 벗어나서 오류 발생

names.append("elsa")    // Array의 마지막에 데이터 추가 ["sangbong", "chulsoo", "yunghee", "elsa"]
names.insert("happy", at: 2)    // 원하는 위치에 데이터 추가 ["sangbong", "chulsoo", "happy", "yunghee", "elsa"]
names.removeFirst()   // 첫번째 데이터 삭제
names.removeLast()    // 마지막 데이터 삭제
names.removeAll()   // 모든 데이터 삭제
```
``` swift
// 배열의 순회 for-in loop
var names = ["sangbong", "chulsoo", "happy", "yunghee", "elsa"]

for name in names {
  print(name)
 }
 // sangbong
 // chulsoo
 // happy
 // yunghee
 // elsa
 
 // 배열의 값과 인덱스가 필요할 때는 enumerated() 메소드 사용
for (num,name) in names.enumerated() {
  print("\(index + 1). \(value)")
}
// 1. sangbong
// 2. chulsoo
// 3. happy
// 4. yunghee
// 5. elsa

```

#### Map
--------
맵(Map)은 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수입니다.
- 스위프트의 Sequence, Collection 프로토콜을 따르는 타입과 옵셔널은 모두 맵을 사용할 수 있습니다.(배열, 딕셔너리, 세트, 옵셔널 등)
- 맵은 기존 데이터를 변형하는데 많이 사용합니다.
- for-in 구문과 큰 차이는 없지만, map 사용시 이점이 있습니다.
  - 코드의 간결성
  - 재사용 용이
  - 컴파일러 최적화 성능 좋음
``` swift
// map의 기본 형태
array.map(transform: T throws -> T)
```
``` swift
let numbers: [Int] = [0, 1, 2, 3, 4]

var doubleNumbers: [Int] = [Int]()

// for-in 구문 사용
for number in numbers {
  doubleNumbers.append(number*2)
}

print(doubleNumbers)    // [0, 2, 4, 6, 8]
```
``` swift
// map 메서드 사용
doubleNumbers = numbers.map { $0 * 2 }

print(doubleNumbers)    // [0, 2, 4, 6, 8]
```
``` swift
// 위와 같은 표현
doubleNumbers = numbers.map({ (number: Int) -> Int in
  return number * 2
})

// 매개변수 및 반환 타입 생략
doubleNumbers = numbers.map ({ return $0 * 2 })

// 반환 키워드 생략
doubleNumbers = numbers.map ({ $0 * 2 })
```
#### Filter
--------
필터는 컨테이너 내부의 값을 걸러서 추출하는 역할을 하는 고차함수입니다.
- 새로운 컨테이너 값을 담아 반환해주지만 기존 콘텐츠를 변형하는 것이 아니라, 특정 조건에 맞게 걸러내는 역할을 합니다.
``` swift
// filter의 기본 형태
array.filter(isIncluded: T throws - > T)
```
``` swift
// filter 메서드 사용
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
  return number % 2 == 0
}

print(evenNumbers)    // [0, 2, 4]

let oddNumbers: [Int] = numbers.filter{ $0 % 2 == 1 }
print(oddNumbers)   // [1, 3, 5]
```
``` swift
// map과 filter 메서드의 연계 사용
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let mappedNumbers: [Int] = numbers.map{ $0 + 3 }

let evenNumbers: [Int] = mappedNumbers.filter { (number: Int) -> Bool in
  return number % 2 == 0
}

print(evenNumbers)    // [4, 6, 8]

// 메서드를 체인처럼 연결하여 사용할 수 있습니다.
let oddNumbers: [Int] = numbers.map{ $0 + 3}.filter{ $0 % 2 == 1 }
print(oddNumbers)   // [3, 5, 7]

```
#### Reduce
--------
리듀스는 컨테이너 내부의 콘텐츠를 하나로 합하는 기능을 실행하는 고차함수입니다.
- 기존 컨테이너에서 내부의 값들을 결합하여 새로운 값을 만듭니다.
``` swift
// reduce의 기본 형태 1 - 클로저가 각 요소를 전달받아 연산한 후 값을 다음 클로저 실행을 위해 반환하며 컨테이너를 순환하는 형태입니다.
public func reduce<Result>(_ initialResult: Result,
  _ nextPartialResult: (Result, Element) throws -> Result ) rethrows -> Result

// reduce의 기본 형태 2 - 컨테이너를 순환하며 클로저가 실행되지만 클로저가 따로 결괏값을 반환하지 않는 형태
public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) 
  throws -> ()) rethrows -> Result
```
``` swift
// reduce 메서드 사용
let numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let sum = numberArray.reduce(0){ $0 + $1 }
print(sum)    // 55

let sum = numberArray.reduce(0, {(first: Int, second: Int) -> Int in
  return first + second
})
print(sum)    // 55
```
``` swift
// 맵, 필터, 리듀스의 활용
enum Gender {
  case male, female, unknown
}

struct Friend {
  let name: String
  let gender: Gender
  let location: String
  var age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "sangbong", gender: .male, location: "천안", age: 25))
friends.append(Friend(name: "chulsoo", gender: .male, location: "서울", age: 30))
friends.append(Friend(name: "yunghee", gender: .female, location: "부산", age: 30))
friends.append(Friend(name: "elsa", gender: .female, location: "인천", age: 25))

var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age) }

result = result.filter{ $0.location != "서울" && $0.age >= 26 }

let string: String = result.reduce("서울 외의 지역에 거주하며 26세 이상인 친구") {
    $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세"
}

print(string)
// 서울 외의 지역에 거주하며 26세 이상인 친구
// yunghee female 부산 30세
```
### 2. Dictionary
딕셔너리는 요소들이 순서 없이 Key와 Value의 쌍으로 구성되는 컬렉션 타입입니다.
- 딕셔너리에 저장되는 값은 항상 키와 쌍을 이루고 있다.
- 하나의 딕셔너리 안의 Key는 같은 이름을 중복해서 사용할 수 없습니다. (딕셔너리에서 키는 값을 대변하는 유일한 식별자)
``` swift
// 딕셔너리 생성
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()    //  키는 String, 값은 Int 타입인 빈 딕셔너리 생성

// 위와 같은 표현
var numberForName: [String: Int] = [String: Int]()
var numberForName: [String: Int] = [:]
```
``` swift
// 딕셔너리 사용
var numberForName: [String: Int] = ["sangbong": 25, "chulsoo": 15, "jenny": 35]

print(numberForName.isEmpty)    // false
print(numberForName.count)    // 3
print(numberForName["sangbong"])    // 25

numberForName["max"] = 999    // max라는 키로 999 추가
print(numberForName["max"])    // 999

numberForName.removeValue(forKey: "sangbong")   // sangbong의 키값을 삭제
print(numberForName["sangbong"])    // nil
```
### 3. Set
세트는 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션타입입니다. 
- 순서가 중요하지 않거나 각 요소가 유일한 값이어야 하는 경우에 사용합니다.
- 세트의 요소는 해시 가능한 값이 들어와야 합니다.
``` swift
// 세트의 생성
var names: Set<String> = Set<String>()
var names: Set<String> = []

var names: Set<String> = ["sangbong", "chulsoo", "happy", "yunghee", "sangbong"]
print(names.count)    // 4

var numbers: [100, 200, 300]    // 타입 추론을 사용하게 되면 컴파일러는 Set가 아닌 Array로 타입 지정
```
``` swift
// 세트의 사용
var names: Set<String> = ["sangbong", "chulsoo", "happy", "yunghee", "sangbong"]
print(names.count)    // 4
names.insert("jenny")
print(names.count)    // 5
names.remove("chulsoo")
pritn(names.count)    // 4
```
``` swift
let firstSet:Set<String> = ["sangbong", "chulsoo", "yunghee", "happy"]
let secondSet:Set<String> = ["sangbong", "chulsoo", "jenny", "elsa"]
// 1. 교집합 : ["sangbong", "chulsoo"]
let intersectSet:Set<String> = firstSet.intersection(secondSet)
// 2. 여집합 : ["yunghee", "happy", "jenny", "elsa"]
let symmetricDiffSet:Set<String> = firstSet.symmetricDifference(secondSet)
// 3. 합집합 : ["sangbong", "chulsoo", "yunghee", "happy", "jenny", "elsa"]
let unionSet:Set<String> = firstSet.union(secondSet)
// 4. 차집합 : ["yunghee", "happy"]
let subtractSet:Set<String> = firstSet.subtracting(secondSet)
// #. 정렬 : ["chulsoo", "elsa", "happy", "jenny", "sangbong", "yunghee"]
print(unionSet.sorted())
```

[Reference]
-
[Collection Types](https://xodhks0113.blogspot.com/2019/05/swift-collection-type-array-dictionary.html)

[애플 공식 문서 한글 번역](https://jusung.gitbook.io/the-swift-language-guide/language-guide/04-collection-types)

야곰, 스위프트 프로그래밍 3판 SWIFT5, 한빛미디어

[고차함수-Map,Filter,Reduce 알아보기](https://shark-sea.kr/entry/Swift-%EA%B3%A0%EC%B0%A8%ED%95%A8%EC%88%98-Map-Filter-Reduce-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0)

-----------------------------------------------------------------------
## Swift 기초 3

### 1. 열거형
열거형은 연관된 항목들을 묶어서 표현할 수 있는 타입입니다. 열거형은 배열이나 딕셔너리 같은 타입과 다르게 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가합니다.
- 기본 열거형
``` swift
enum CompassPoint {
  case north    
  case south        
  case east         
  case west
}

// 위와 같은 표현 - 각각이 아닌 한번에 나열
enum CompassPoint {
  case north, south, east, west
}

// 열거형 변수의 생성 및 값 변경
var moveCompassPoint: CompassPoint = CompassPoint.south

// 위와 같은 표현
var moveCompassPoint: CompassPoint = .south

// 같은 타입인 CompassPoint 내부의 항목으로만 moveCompassPoint의 값을 변경해줄 수 있습니다.
moveCompassPoint = .west
```
- 원시 값
  - 특정 타입의 값을 원시 값으로 가지고 싶다면 열거형 이름 오른쪽에 타입을 명시해 주면 됩니다.
  - 원시 값을 사용하고 싶다면 rawValue라는 프로퍼티를 통해 가져올 수 있습니다.
``` swift
enum CompassPoint: String {
  case east = "동"
  case west = "서"
  case south = "남"
  case north = "북"
}

let myHomeCompassPoint: CompassPoint = CompassPoint.south
print("우리 집은 \(myHomeCompassPoint.rawValue)쪽에 있습니다.")
// 우리 집은 남쪽에 있습니다.

enum WeekDays: Character {
  case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}
let today: WeekDays = WeekDays.fri
print("\(today.rawValue)요일 좋아~")  // 금요일 좋아~
```
``` swift
// 열거형의 원시 값 일부 지정 및 자동 처리
enum CompassPoint: String {
  case east = "동"
  case west
  case south = "남"
  case north = "북"
}

let myHomeCompassPoint: CompassPoint = CompassPoint.west
print("우리 집은 \(myHomeCompassPoint.rawValue)쪽에 있습니다.")   // 우리 집은 west쪽에 있습니다.

enum Numbers: Int {
  case zero
  case one
  case two
  case ten = 10
}
print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")   
// 0, 1, 2, 10
```
- 연관 값
  - 열거형 내의 항목(case)이 자신과 연관된 값을 가질 수 있습니다. 
  - 연관 값은 각 항목 옆에 소괄호로 묶어 표현할 수 있습니다. 
  - 다른 항목이 연관 값을 갖는다고 모든 항목이 연관 값을 가질 필요는 없습니다.
``` swift
// 연관 값을 갖는 열거형 응용 - Switch문 사용
enum PastaTaste {
    case cream, tomato
}

enum PizzaDough {
    case cheeseCrust, thin, original
}

enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDish {
  case pasta(taste: PastaTaste)
  case pizza(dough: PizzaDough, topping: PizzaTopping)
  case chicken(withSource: Bool)
  case rice
}

extension MainDish {
    func printMainDish() {
        switch mainDish {
        case .pasta(taste: let taste):
            print("\(taste) pasta")
        case .pizza(dough: let dough, topping: let topping):
            print("\(dough) dough + \(topping) topping pizza")
        case .chicken(withSource: let withSource):
            print("\(withSource) chicken")
        case .rice :
            print("밥추가")
            break
        }
    }
}

var mainDish: MainDish = MainDish.pizza(dough: .cheeseCrust, topping: .pepperoni)
// 연관 값을 출력합니다.
mainDish.printMainDish()    // cheeseCrust dough + pepperoni topping pizza
```
- 항목 순회
  - 열거형의 포함된 모든 케이스를 알아야 할 때 CaseIterable 프로토콜을 채택합니다.
  - 그러면 열거형에 allCases라는 타입프로퍼티를 통해 모든 케이스의 컬렉션을 생성해 줍니다.
``` swift
// CaseIterable 프로토콜과 원시값을 갖는 열거형의 항목 순회
enum School: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middel = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let allCases: [School] = School.allCases
print(allCases)
// [School.primary, School.elementary, School.middel, School.high, School.college, School.university, School.graduate]
```
  - 특정 케이스를 플랫폼에 따라 사용할 수 있거나 없는 경우가 생기면 CaseIterable 프로토콜을 채택하는 것만으로는 allCases 프로퍼티를 사용할 수 없습니다.
  - 이럴 때는 allCases 프로터리를 구현해 주어야 합니다.
``` swift
// 플랫폼별로 사용 조건을 추가하는 경우
enum School: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [School] {
        let all: [School] = [ .primary,
                              .elementary,
                              .middle,
                              .high,
                              .college,
                              .university]
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}

let allCases: [School] = School.allCases
print(allCases)
// 실행환경에 따라 다른 결과
// [School.primary, School.elementary, School.middel, School.high, School.college, School.university, School.graduate]

// 연관 값을 갖는 열거형의 항목 순회
enum PastaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable {
    case pepperoni, cheese, bacon
}

enum MainDish: CaseIterable {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSource: Bool)
    case rice

    static var allCases: [MainDish] {
        return PastaTaste.allCases.map(MainDish.pasta)
        + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in
            result + PizzaTopping.allCases.map{ (topping) -> MainDish in
                MainDish.pizza(dough: dough, topping: topping)
            }
        }
        + [true, false].map(MainDish.chicken)
        + [MainDish.rice]
    }
}

print(MainDish.allCases.count)      // 14
print(MainDish.allCases)    // 모든 경우의 연관 값을 갖는 케이스 컬렉션
```
- 순환 열거형
  - 열거형 항목의 연관 값이 열거형 자신의 값이고자 할 때 사용합니다.
  - 순환 열거형을 명시하고 싶다면 indirect, 특정 항목에만 한정하고 싶으면 case 키워드 앞에 indirect, 열거형 전체에 적용하고 싶다면 enum 키워드 앞에 indirect 키워드를 붙이면 됩니다.
``` swift
// 순환 열거형의 사용
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")    // (5 + 4) * 2 = 18
```
- 비교 가능한 열거형
  - Comparable 프로토콜을 준수하는 연관 값만 갖거나 연관 값이 없는 열거형은 Comparable 프로토콜을 채택하면 각 케이스를 비교할 수 있습니다. 
  - 앞에 위치한 케이스가 더 작은 값이 됩니다.
``` swift
enum Condition: Comparable {
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else {
    print("당신의 상태가 더 좋아요")
}
// 제 상태가 더 좋군요

enum Device: Comparable {
    case iPhone(version: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(version: "14.3"))
devices.append(Device.iPhone(version: "6.1"))
devices.append(Device.iPad(version: "10.3"))
devices.append(Device.macBook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)
// [Device.iPhone(version: "14.3"), Device.iPhone(version: "6.1"), Device.iPad(version: "10.3"), Device.macBook, Device.iMac]
```
### 2. 연산자
``` swift
```
### 3. 접근제어
``` swift
```

[Reference]
-
[열거형](https://xodhks0113.blogspot.com/2019/07/swift.html)

[애플 공식 문서 한글 번역](https://jusung.gitbook.io/the-swift-language-guide/language-guide/08-enumerations)

야곰, 스위프트 프로그래밍 3판 SWIFT5, 한빛미디어
