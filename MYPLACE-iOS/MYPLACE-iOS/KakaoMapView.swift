//
//  KakaoMapView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI
import UIKit
import KakaoMapsSDK
import CoreLocation

struct KakaoMapView: UIViewRepresentable {
    @Binding var draw: Bool
    
    /// UIView를 상속한 KMViewContainer를 생성한다.
    /// 뷰 생성과 함께 KMControllerDelegate를 구현한 Coordinator를 생성하고, 엔진을 생성 및 초기화한다.
    func makeUIView(context: Self.Context) -> KMViewContainer {
        let view: KMViewContainer = KMViewContainer()
        view.sizeToFit()
        context.coordinator.createController(view)
        context.coordinator.controller?.initEngine()
        
        return view
    }
    
    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    /// draw가 true로 설정되면 엔진을 시작하고 렌더링을 시작한다.
    /// draw가 false로 설정되면 렌더링을 멈추고 엔진을 stop한다.
    func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
        if draw {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                context.coordinator.controller?.startEngine()
                context.coordinator.controller?.startRendering()
            }
        }
        else {
            context.coordinator.controller?.stopRendering()
            context.coordinator.controller?.stopEngine()
        }
    }
    
    /// Coordinator 생성
    func makeCoordinator() -> KakaoMapCoordinator {
        return KakaoMapCoordinator.shared
    }

    /// Cleans up the presented `UIView` (and coordinator) in
    /// anticipation of their removal.
    static func dismantleUIView(_ uiView: KMViewContainer, coordinator: KakaoMapCoordinator) {
        
    }
    
    /// Coordinator 구현. KMControllerDelegate를 adopt한다.
    
}

final class KakaoMapCoordinator: NSObject, MapControllerDelegate {
    static let shared = KakaoMapCoordinator()
    
    var controller: KMController?
    var first: Bool

    override init() {
        first = true
        super.init()
    }
    
     // KMController 객체 생성 및 event delegate 지정
    func createController(_ view: KMViewContainer) {
        controller = KMController(viewContainer: view)
        controller?.delegate = self
    }
    
     // KMControllerDelegate Protocol method구현
     
      /// 엔진 생성 및 초기화 이후, 렌더링 준비가 완료되면 아래 addViews를 호출한다.
      /// 원하는 뷰를 생성한다.
    func addViews() {
        let defaultPosition: MapPoint = MapPoint(longitude: 126.9770, latitude: 37.57861)
        let mapviewInfo: MapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: defaultPosition)
        
        if controller?.addView(mapviewInfo) == Result.OK {
            let _ = controller?.getView("mapview") as! KakaoMap
        }
        
        createLabelLayer()
        createPoiStyle()
        createPois()
    }
    
    /// KMViewContainer 리사이징 될 때 호출.
    func containerDidResized(_ size: CGSize) {
        let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
        mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
        if first {
            let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: 126.9770, latitude: 37.57861), zoomLevel: 15, mapView: mapView!)
            mapView?.moveCamera(cameraUpdate)
            first = false
        }
    }
    
    func animateCamera(lon: Double, lat: Double) {
        let mapView: KakaoMap = controller?.getView("mapview") as! KakaoMap
        let cameraUpdate = CameraUpdate.make(target: MapPoint(longitude: lon, latitude: lat), zoomLevel: 15, mapView: mapView)
        mapView.animateCamera(cameraUpdate: cameraUpdate, options: CameraAnimationOptions(autoElevation: false, consecutive: true, durationInMillis: 2000))
    }

    // Poi생성을 위한 LabelLayer 생성
    func createLabelLayer() {
        let view = controller?.getView("mapview") as! KakaoMap
        let manager = view.getLabelManager()
        let layerOption = LabelLayerOptions(layerID: "PoiLayer", competitionType: .none, competitionUnit: .symbolFirst, orderType: .rank, zOrder: 0)
        let _ = manager.addLabelLayer(option: layerOption)
    }
    
    // Poi 표시 스타일 생성
    func createPoiStyle() {
        let view = controller?.getView("mapview") as! KakaoMap
        let manager = view.getLabelManager()
        
//            let noti1 = PoiBadge(badgeID: "Cafe", image: UIImage(named: "CafeIcon"), offset: CGPoint(x: 0.0, y: 0.0), zOrder: 0)
        let icon1 = PoiIconStyle(symbol: UIImage(named: "PoiIcon"), anchorPoint: CGPoint(x: 0.0, y: 0.0))
        let perLevelStyle1 = PerLevelPoiStyle(iconStyle: icon1, level: 0)
        let poiStyle1 = PoiStyle(styleID: "purple", styles: [perLevelStyle1])
        manager.addPoiStyle(poiStyle1)
        
        let icon2 = PoiIconStyle(symbol: UIImage(named: "PoiIcon_Ad"), anchorPoint: CGPoint(x: 0.0, y: 0.0))
        let perLevelStyle2 = PerLevelPoiStyle(iconStyle: icon2, level: 0)
        let poiStyle2 = PoiStyle(styleID: "Added", styles: [perLevelStyle2])
        manager.addPoiStyle(poiStyle2)
        
        // PoiBadge는 스타일에도 추가될 수 있다. 이렇게 추가된 Badge는 해당 스타일이 적용될 때 함께 그려진다.
        
        //let iconStyle1 = PoiIconStyle(symbol: UIImage(named: "pin_green.png"), anchorPoint: KMNormalizedPoint(x: 0.0, y: 0.5), badges: [noti1])
        //let noti2 = PoiBadge(badgeID: "badge2", image: UIImage(named: "noti2.png"), offset: KMNormalizedPoint(x: 0.9, y: 0.1), zOrder: 0)
        //let iconStyle2 = PoiIconStyle(symbol: UIImage(named: "pin_red.png"), anchorPoint: KMNormalizedPoint(x: 0.0, y: 0.5), badges: [noti2])
        
        // 5~11, 12~21 에 표출될 스타일을 지정한다.
//            let poiStyle = PoiStyle(styleID: "PerLevelStyle", styles: [
//                PerLevelPoiStyle(iconStyle: iconStyle1, level: 5),
//                PerLevelPoiStyle(iconStyle: iconStyle2, level: 12)
//            ])
//            manager.addPoiStyle(poiStyle)
    }
    
    func createPois() {
        print("createPois")
        let view = controller?.getView("mapview") as! KakaoMap
        let manager = view.getLabelManager()
        let layer = manager.getLabelLayer(layerID: "PoiLayer")
        let poiOption = PoiOptions(styleID: "purple")
        poiOption.rank = 0
        poiOption.clickable = true
       
        
        let poi1 = layer?.addPoi(option:poiOption, at: MapPoint(longitude: 126.9770, latitude: 37.57861))
        // Poi 개별 Badge추가. 즉, 아래에서 생성된 Poi는 Style에 빌트인되어있는 badge와, Poi가 개별적으로 가지고 있는 Badge를 갖게 된다.
        let resizedImage = resizeImage(image: UIImage(named: "CafeIcon")!, targetSize: CGSize(width: 60, height: 60))
        let badge = PoiBadge(badgeID: "Cafe", image: resizedImage, offset: CGPoint(x: 0.5, y: 0.3), zOrder: 1)
        poi1?.addBadge(badge)
        poi1?.show()
//            print(poi1?.itemID as Any)
//            poi1?.showBadge(badgeID: "noti")
        layer?.showAllPois()
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(targetSize)
        image.draw(in: CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

}

#Preview {
    KakaoMapView(draw: .constant(true))
}
