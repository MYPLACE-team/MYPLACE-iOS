//
//  NotificationView.swift
//  MYPLACE-iOS
//
//  Created by 김영준 on 12/28/23.
//

import SwiftUI

struct NotificationView: View {
    @State private var selectedTab: String = "전체"
    @State private var alramOn: Bool = true
    @State private var allNotifications = notifications
    @State private var newNotifications = notifications.filter {!$0.read}
    @State private var coupons = coupon
    
    @Binding var path: [PathModel]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 24) {
                VStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Text("전체")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.bold)
                            )
                            .foregroundStyle(selectedTab == "전체" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                        Text(allNotifications.count < 100 ? "\(allNotifications.count)" : "99+")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.2, green: 0.25, blue: 0.33))
                            .padding(.horizontal, 8)
                            .padding(.top, 1)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 0.95, green: 0.96, blue: 0.97))
                                )
                    }
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 4, topTrailing: 4))
                      .foregroundColor(selectedTab == "전체" ? Color.accentColor : .clear)
                      .frame(height: 3)
                }
                .onTapGesture {
                    selectedTab = "전체"
                }
                VStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Text("새 알림")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.bold)
                            )
                            .foregroundStyle(selectedTab == "새 알림" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                        Text(newNotifications.count < 100 ? "\(newNotifications.count)" : "99+")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.2, green: 0.25, blue: 0.33))
                            .padding(.horizontal, 8)
                            .padding(.top, 1)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 0.95, green: 0.96, blue: 0.97))
                                )
                    }
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 4, topTrailing: 4))
                      .foregroundColor(selectedTab == "새 알림" ? Color.accentColor : .clear)
                      .frame(height: 3)
                }
                .onTapGesture {
                    selectedTab = "새 알림"
                }
                VStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Text("쿠폰")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.bold)
                            )
                            .foregroundStyle(selectedTab == "쿠폰" ? Color.accentColor : Color(red: 0.39, green: 0.45, blue: 0.55))
                        Text(coupons.count < 100 ? "\(coupons.count)" : "99+")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.2, green: 0.25, blue: 0.33))
                            .padding(.horizontal, 8)
                            .padding(.top, 1)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 0.95, green: 0.96, blue: 0.97))
                                )
                    }
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 4, topTrailing: 4))
                      .foregroundColor(selectedTab == "쿠폰" ? Color.accentColor : .clear)
                      .frame(height: 3)
                }
                .onTapGesture {
                    selectedTab = "쿠폰"
                }
            }
            .frame(height: 40)
            .padding(.horizontal, 24)
            if (selectedTab == "전체") {
                HStack(spacing: 0) {
                    Spacer()
                    Button(action: {
                        allNotifications = []
                    })
                    {
                        Text("모두 읽음처리 ")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.18, green: 0.44, blue: 0.91))
                            .padding(.trailing, 10)
                    }
                }
                
                if(alramOn && allNotifications.count > 0) {
                    List {
                        ForEach(allNotifications.indices, id: \.self) {index in
                            NotificationCellView(item: $allNotifications[index])
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .background(!$allNotifications[index].read.wrappedValue ? Color.clear : Color(red: 0.97, green: 0.97, blue: 0.97))
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button (action: {
                                        allNotifications.remove(at: index)
                                        if let newIdx = newNotifications.firstIndex(of: notifications[index]) {
                                            newNotifications.remove(at: newIdx)
                                        }
                                    })
                                    {
                                        Image(systemName: "xmark")
                                            .foregroundStyle(.white)
                                    }.tint(.red)
                                }
                                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                    Button(action: {
                                        $allNotifications[index].read.wrappedValue = true
                                        if let newIdx = newNotifications.firstIndex(of: notifications[index]) {
                                            newNotifications.remove(at: newIdx)
                                        }
                                    })
                                    {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.white)
                                    }.tint(.green)
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, 6)
                    Spacer()
                } else {
                    if(!alramOn) {
                        HStack(alignment: .top, spacing: 6) {
                            Text("*")
                                .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                .foregroundStyle(Color(red: 0.76, green: 0.09, blue: 0.09))
                                .padding(.top, 2)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("알림이꺼져있어요!")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                    .foregroundStyle(.black.opacity(0.4))
                                HStack(spacing: 0) {
                                    Text("설정 > 알림관리 > 관심장소")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 15).weight(.bold))
                                        .foregroundStyle(.black.opacity(0.4))
                                    Text(" 알림 설정을 활성화해주세요!")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                        .foregroundStyle(.black.opacity(0.4))
                                }
                            }
                        }
                        .padding(.top, 26)
                    }
                    VStack (spacing: 0) {
                        Image("Notification")
                            .padding(.top, -60)
                        Text("새로운 알림이 없습니다. ")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                            .padding(.top, 16)
                        Text("새로운 알림이 오면 알려드릴게요 !")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14))
                            .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.5))
                            .padding(.top, 12)
                    }.frame(maxHeight: .infinity)
                }
            } else if (selectedTab == "새 알림") {
                HStack(spacing: 0) {
                    Spacer()
                    Button(action: {
                        newNotifications = []
                    })
                    {
                        Text("모두 읽음처리 ")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundStyle(Color(red: 0.18, green: 0.44, blue: 0.91))
                            .padding(.trailing, 10)
                    }
                }
                if(alramOn && newNotifications.count > 0) {
                    List {
                        ForEach(newNotifications.indices, id: \.self) {index in
                            NotificationCellView(item: $newNotifications[index])
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .background(!$newNotifications[index].read.wrappedValue ? Color.clear : Color(red: 0.97, green: 0.97, blue: 0.97))
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button (action: {
                                        allNotifications.removeAll{ $0.id == $newNotifications[index].id }
                                        newNotifications.remove(at: index)
                                    })
                                    {
                                        Image(systemName: "xmark")
                                            .foregroundStyle(.white)
                                    }.tint(.red)
                                }
                                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                    Button(action: {
                                        $allNotifications.filter{ $0.id == $newNotifications[index].id }.first?.read.wrappedValue = true
                                        newNotifications.remove(at: index)
                                    })
                                    {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.white)
                                    }.tint(.green)
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, 6)
                    Spacer()
                } else {
                    if(!alramOn) {
                        HStack(alignment: .top, spacing: 6) {
                            Text("*")
                                .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                .foregroundStyle(Color(red: 0.76, green: 0.09, blue: 0.09))
                                .padding(.top, 2)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("알림이꺼져있어요!")
                                    .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                    .foregroundStyle(.black.opacity(0.4))
                                HStack(spacing: 0) {
                                    Text("설정 > 알림관리 > 관심장소")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 15).weight(.bold))
                                        .foregroundStyle(.black.opacity(0.4))
                                    Text(" 알림 설정을 활성화해주세요!")
                                        .font(Font.custom("Apple SD Gothic Neo", size: 15))
                                        .foregroundStyle(.black.opacity(0.4))
                                }
                            }
                        }
                        .padding(.top, 26)
                    }
                    VStack (spacing: 0) {
                        Image("Notification")
                            .padding(.top, -60)
                        Text("새로운 알림이 없습니다. ")
                            .font(
                                Font.custom("Apple SD Gothic Neo", size: 16)
                                    .weight(.semibold)
                            )
                            .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                            .padding(.top, 16)
                        Text("새로운 알림이 오면 알려드릴게요 !")
                            .font(Font.custom("Apple SD Gothic Neo", size: 14))
                            .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.5))
                            .padding(.top, 12)
                    }.frame(maxHeight: .infinity)
                }
            } else { //쿠폰
                List {
                    ForEach(coupons.indices, id: \.self) {index in
                        NotificationCellView(item: $coupons[index])
                            .overlay(
                                Text("사용 기간 : 2024.02.01 - 2024.02.09")
                                    .font(
                                        Font.custom("Apple SD Gothic Neo", size: 11)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.62, green: 0.64, blue: 0.67))
                                    .padding(.bottom, 6)
                                    .padding(.trailing, 6)
                                ,alignment: .bottomTrailing)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .background(!$coupons[index].read.wrappedValue ? Color.clear : Color(red: 0.97, green: 0.97, blue: 0.97))
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button (action: {
                                    coupons.remove(at: index)
                                })
                                {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.white)
                                }.tint(.red)
                            }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 6)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
            ToolbarItem(placement: .principal) {
                Text("알림")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
            }
        }
    }
}

#Preview {
    NotificationView(path: .constant([]))
}

struct NotificationCellView: View {
    @Binding var item: NotificationCell
    
    var body: some View {
        HStack(spacing: 21){
            Circle()
                .frame(width: 52, height: 52)
                .foregroundStyle(Color(red: 0.95, green: 0.95, blue: 0.95))
                .overlay(
                    HStack{
                        if(item.icon == "check") {
                            Image(systemName:"checkmark.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color(red: 0.43, green: 0.73, blue: 1))
                        } else if (item.icon == "bookmark") {
                            Image(systemName:"bookmark.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color(red: 0.49, green: 0.47, blue: 0.75))
                        } else if (item.icon == "star") {
                            Image("BigStarFill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color(red: 0.88, green: 0.88, blue: 0.53))
                        } else if (item.icon == "coupon") {
                            Image("Coupon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                    }
                )
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 3) {
                Text(item.title)
                    .font(
                        Font.custom("Apple SD Gothic Neo", size: 17)
                            .weight(.bold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                HStack(spacing: 0) {
                    ForEach(item.content.indices) {idx in
                        if(idx % 2 == 0) {
                            Text(item.content[idx])
                                .font(Font.custom("Apple SD Gothic Neo", size: 17))
                                .foregroundStyle(Color(red: 0.14, green: 0.18, blue: 0.26))
                        } else {
                            Text(item.content[idx]).bold()
                                .font(Font.custom("Apple SD Gothic Neo", size: 17))
                                .foregroundStyle(Color(red: 0.14, green: 0.18, blue: 0.26))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 90)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color(red: 0.94, green: 0.94, blue: 0.96))
            , alignment: .bottom)
    }
}
