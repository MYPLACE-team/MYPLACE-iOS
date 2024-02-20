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

//홈뷰                         homeViewModel.getHomeViewInformation() 하고 핀찍어야함

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
    @ObservedObject var favoritePlaceViewModel = FavoritePlaceViewModel.shared
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
        let defaultPosition: MapPoint = MapPoint(longitude: 126.969060248121, latitude: 37.5783548144367)
        let mapviewInfo: MapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: defaultPosition)
        
        if controller?.addView(mapviewInfo) == Result.OK {
            let _ = controller?.getView("mapview") as! KakaoMap
        }
        animateCamera(lon: 126.969060248121, lat: 37.5783548144367)
        
        createLabelLayer()
        createPoiStyle()
        for place in favoritePlaceViewModel.result {
            if place.isVisited == 3000 { //방문 했던 장소는 회색으로 설정
                createPois(lon: Double(place.lon) ?? 127, lat: Double(place.lat) ?? 37.5, categoryID: place.categoryID, poiColor: "gray")
            }
            else {                       //방문 할 장소는 보라색으로 설정
                createPois(lon: Double(place.lon) ?? 127, lat: Double(place.lat) ?? 37.5, categoryID: place.categoryID, poiColor: "purple")
            }
            print("\(place.lon), \(place.lat), \(place.categoryID)")
        }
//        createPois(lon: 126.9800979573524, lat: 37.578627489574416, categoryID: 2, poiColor: "yellow")
        createPois(lon: 126.969060248121, lat: 37.5783548144367, categoryID: 4, poiColor: "yellow")
    }
    
    /// KMViewContainer 리사이징 될 때 호출.
    func containerDidResized(_ size: CGSize) {
        let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
        mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
        if first {
            let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: 126.969060248121, latitude: 37.5783548144367), zoomLevel: 15, mapView: mapView!)
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
    
    func createPoiStyle() {
        let view = controller?.getView("mapview") as! KakaoMap
        let manager = view.getLabelManager()
        
        let resizedPoiImage = resizeImage(image: UIImage(named: "PoiIcon_Ad")!, targetSize: CGSize(width: 132, height: 172.8))
        let yellowIcon = PoiIconStyle(symbol: resizedPoiImage, anchorPoint: CGPoint(x: 0.5, y: 0.95))
        let perLevelStyleYellow = PerLevelPoiStyle(iconStyle: yellowIcon, level: 0)
        let yellowPoi = PoiStyle(styleID: "yellow", styles: [perLevelStyleYellow])
        manager.addPoiStyle(yellowPoi)
        
        let purpleIcon = PoiIconStyle(symbol: UIImage(named: "PoiIcon_Purple"), anchorPoint: CGPoint(x: 0.5, y: 0.995))
        let perLevelStylePurple = PerLevelPoiStyle(iconStyle: purpleIcon, level: 0)
        let purplePoi = PoiStyle(styleID: "purple", styles: [perLevelStylePurple])
        manager.addPoiStyle(purplePoi)
        
        let grayIcon = PoiIconStyle(symbol: UIImage(named: "PoiIcon_Black"), anchorPoint: CGPoint(x: 0.5, y: 0.995))
        let perLevelStyleGray = PerLevelPoiStyle(iconStyle: grayIcon, level: 0)
        let grayPoi = PoiStyle(styleID: "gray", styles: [perLevelStyleGray])
        manager.addPoiStyle(grayPoi)
    }
    
    func createPois(lon: Double, lat: Double, categoryID: Int, poiColor: String) {
        let view = controller?.getView("mapview") as! KakaoMap
        let manager = view.getLabelManager()
        let layer = manager.getLabelLayer(layerID: "PoiLayer")
        let poiOption = PoiOptions(styleID: poiColor)
        poiOption.rank = 0
        
        let poi1 = layer?.addPoi(option:poiOption, at: MapPoint(longitude: lon, latitude: lat))
        let BadgeImageName: String
        switch categoryID {
        case 1:
            BadgeImageName = "CafeIcon"
        case 2:
            BadgeImageName = "ChineseFoodIcon"
        case 3:
            BadgeImageName = "JapaneseFoodIcon"
        case 4:
            BadgeImageName = "WesternFoodIcon"
        case 5:
            BadgeImageName = "KoreanFoodIcon"
        case 6:
            BadgeImageName = "BarIcon"
        case 7:
            BadgeImageName = "DessertIcon"
        case 8:
            BadgeImageName = "CulturalSpaceIcon"
        case 9:
            BadgeImageName = "AsianIcon"
        case 10:
            BadgeImageName = "MeatIcon"
        case 11:
            BadgeImageName = "PopupStoreIcon"
        case 0:
            BadgeImageName = "EtcIcon"
        default:
            BadgeImageName = "EtcIcon"
        }
        var badgeOffset: CGPoint
        switch BadgeImageName {
        case "CafeIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "ChineseFoodIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "JapaneseFoodIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "WesternFoodIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.41)
        case "KoreanFoodIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "BarIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "DessertIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.35)
        case "CulturalSpaceIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "AsianIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "MeatIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "PopupStoreIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        case "EtcIcon":
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        default:
            badgeOffset = CGPoint(x: 0.5, y: 0.38)
        }
        let resizedImage = resizeImage(image: UIImage(named: BadgeImageName)!, targetSize: CGSize(width: 60, height: 60))
        let badge = PoiBadge(badgeID: PlaceType(rawValue: categoryID)?.emojiForCategory() ?? "Cafe", image: resizedImage, offset: badgeOffset, zOrder: 1)
        poi1?.addBadge(badge)
        poi1?.show()
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
