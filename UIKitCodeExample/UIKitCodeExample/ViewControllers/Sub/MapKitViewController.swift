//
//  MapKitViewController.swift
//  UIKitCodeExample
//
//  Created by 이상봉 on 2022/01/04.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController, CLLocationManagerDelegate {

    // 3-3. MapKitView 생성
    let mapKit: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    // 현재 위치 나타낼 Label 생성
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // location manager
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "MapKitView"
        view.backgroundColor = .white
        configureMapKit()
        configureLocationLabel()
        
        locationManager.delegate = self
        
        // 정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 데이터를 추적하기 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트를 시작
        locationManager.startUpdatingLocation()
        // 위치 보기 설정
        mapKit.showsUserLocation = true
    }
    
    func configureMapKit() {
        // view에 mapKitView 추가
        view.addSubview(mapKit)
        
        // 레이아웃 설정
        NSLayoutConstraint.activate([
            mapKit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mapKit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapKit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    func configureLocationLabel() {
        // view에 라벨 추가
        view.addSubview(locationLabel)
        
        // 레이아웃 설정
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationLabel.topAnchor.constraint(equalTo: mapKit.bottomAnchor, constant: 50),
            locationLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            locationLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
    func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapKit.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                   longtudeValue: (pLocation?.coordinate.longitude)!,
                   delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = ""
            if country != nil {
                address = country!
            }
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            self.locationLabel.text = "현재 위치 : \(address)"
        })
        locationManager.stopUpdatingLocation()
    }
    
}
