//
//  LocationPolicyView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/19/24.
//

import SwiftUI

struct LocationPolicyView: View {
    @Binding var path: [PathModel]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing: 0) {
                Text("📚 마플 위치기반서비스 이용 약관")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 24)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                // MARK: - 제 1조
                Text("제1조 (목적)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                Text("이 약관은 ‘마플'(이하 \"회사\"라 함)과 마플 위치기반서비스(이하 \"서비스\"라 함)를 이용하는 고객 사이의 서비스 이용에 관한 제반사항을 정함을 목적으로 합니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 2조
                
                Text("제2조 (용어의 정의)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("이 약관에서 사용하는 용어의 의미는 다음 각 호와 같습니다. 아래 각 호에서 정의되지 않은 이 약관 상의 용어의 의미는 직방 이용약관 및 일반적인 거래관행에 의합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("a. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("마플이란 회사가 제공하는 위치기반서비스입니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                Text("b. 회사가 제공하는 서비스는 다음과 같습니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                Text("i. 장소에 관련한 정보제공 서비스")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 36)
                Text("ii.관심장소 등록 서비스")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 36)
                Text("iii. 장소 제안 및 추천 서비스 등 ")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 36)
                HStack(alignment: .top, spacing: 0) {
                    Text("c. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("고객이라 함은 마플을 이용하는 이용자를 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("d. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원이라 함은 회사에 개인정보를 제공하고 회원등록을 한 자로서, 마플의 정보를 지속적으로 제공받으며, 회사가 제공하는 마플의 서비스를 계속적으로 이용할 수 있는 자를 말합니다. 회사는 서비스의 원활한 제공을 위해 회원의 등급을 회사 내부의 규정에 따라 나눌 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("이 약관은 「위치정보의 보호 및 이용 등에 관한 법률」 및 관계 법령 등에서 정하는 바에 따릅니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 3조
                
                Text("제3조 (계약의 체결 및 해지)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("고객은 회사의 서비스를 이용하고자 하는 경우, 약관의 고지 내용에 따라 개인위치정보 서비스에 가입하게 됩니다. 회원의 경우 회원가입 시 동의절차를 밟습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("고객은 계약을 해지하고자 할 때에는 가입 회원탈퇴를 하거나, 회사의 개인정보보호 담당자에게 이메일을 통해 해지신청을 하여야 합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 4조
                
                Text("제4조 (서비스의 내용)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 고객의 현재 위치정보만을 고객에게 제공하며, 해당 위치정보를 다른 정보와 결합하여 개인위치정보로 이용하지 않습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("제공되는 고객의 위치정보는 해당 스마트폰 등에서 제공합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                        .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                        .padding(.top, 10)
                        .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("3. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 마플의 모바일 단말기 전용 어플리케이션(이하 \"어플리케이션\")을 통해 아래와 같은 위치기반서비스를 제공합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("a. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("접속 위치 제공 서비스: 위치 정보 사용을 승인한 고객들의 서비스 최종 접속 위치를 기반으로 서비스 내의 정보를 지도 위에 혹은 리스트를 통해 제공합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("b. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("위치 정보: 모바일 단말기 등의 WPS(Wifi Positioning System), GPS 기반으로 추출된 좌표를 이용하여 고객이 생성하는 지점을 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("c. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("최종 접속 위치를 활용한 검색 결과 제공 서비스: 정보 검색 요청 시 개인위치정보주체의 현위치를 이용한 서비스 내의 기능에 따라 제공되는 정보에 대하여 검색 결과를 제시합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("d. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("고객의 위치 정보의 갱신은 마플 실행 시 또는 실행 후, 위치 관련 메뉴 이용 시 이루어지며, 고객이 갱신한 사용자의 위치정보를 기준으로 최종 위치를 반영합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                
                // MARK: - 제 5조
                
                Text("제5조 (서비스 이용요금)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사가 제공하는 서비스는 기본적으로 무료 서비스 입니다. 어떠한 형태의 유료 기능도 존재하지 않습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며 가입한 각 이동통신사의 정책에 따릅니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 6조
                
                Text("제6조 (이용시간)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("마플의 이용은 24시간 가능하며, 다만, 시스템 장애, 프로그램 오류 보수, 외부요인 등 불가피한 경우에는 해당 공지를 통해 사전에 통지합니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 7조
                
                Text("제7조 (접속자의 위치정보 이용)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("회사는 회원이 약관 등에 동의하는 경우 또는 비회원이 위치관련 메뉴 이용시에 한해 단말기를 통해 수집된 위치정보를 활용하여 정보 및 회원의 게시물을 제공할 수 있습니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("약관 등에 동의를 한 회원 또는 비회원이 위치관련 메뉴 사용시 서비스 이용을 위해 본인의 위치를 자의적으로 노출하였다고 간주하며 회사는 고객의 실시간 위치정보를 바탕으로 컨텐츠를 제공합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("장소정보 및 컨텐츠 입력 등 서비스 이용 시 회원이 생성한 컨텐츠에 대해 회사는 회원의 위치에 대한 정보를 저장, 보존하지 않습니다. 회사는 장소정보 또는 회원이 등록한 게시물을 고객의 현재위치를 기반으로 추천하기 위해 위치정보를 이용합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 8조
                
                Text("제8조 (개인위치정보의 이용 또는 제공에 관한 동의)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 \"서비스\"를 제공하는 경우에는 제공 받는 자 및 제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게 제공받는 자, 제공 일시 및 제공목적을 즉시 통보합니다. 다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("a. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("b. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("3. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 본 약관의 목적 외 다른 용도로 개인위치정보의 이용 또는 제공사실 확인자료를 기록하거나 보존하지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("4. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 6개월 이상 보관합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 9조
                
                Text("제9조 (개인위치정보주체의 권리)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체는 개인위치정보의 이용•제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체는 언제든지 개인위치정보의 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("3. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                
                HStack(alignment: .top, spacing: 0) {
                    Text("a. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체에 대한 위치정보 이용, 제공사실 확인자료")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("b. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("4. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 이용제공사실 확인자료(동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 이용제공사실 확인자료에 한합니다)를 파기합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("5. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체는 제1항 내지 제3항의 권리행사를 위하여 이 약관 제15조의 연락처를 이용하여 회사에 요구할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 10조
                
                Text("제10조 (\"서비스\"의 변경 및 중지)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 위치정보사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를 제한, 변경하거나 중지할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 및 서비스 화면 등에 공지하거나 개인위치정보주체에게 통지합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                
                // MARK: - 제 11조
                
                Text("제11조 (위치정보관리책임자의 지정)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 위치정보를 관리, 보호하고, 거래 시 고객의 개인위치정보로 인한 불만을 원활히 처리할 수 있는 위치정보관리책임자를 지정해 운영합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("위치정보관리책임자는 위치기반서비스를 제공하는 부서장으로서 구체적인 사항은 본 약관의 부칙에 따릅니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 12조
                
                Text("제12조 (손해배상 및 면책)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보주체는 회사의 다음 각 호에 해당하는 행위로 손해를 입은 경우에 회사에 대해 손해배상을 청구할 수 있습니다. 이 경우 개인위치정보주체는 회사의 고의 또는 과실이 있음을 직접 입증하여야 합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("a. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("법령에서 허용하는 경우를 제외하고 이용자 또는 개인위치정보주체의 동의 없이 위치정보를 수집, 이용하는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("b. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인위치정보의 누출, 변조, 훼손 등의 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 천재지변 등 불가항력적인 사유나 이용자의 고의 또는 과실로 인하여 발생한 때에는 손해를 배상하지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("3. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사는 이용자가 망사업자의 통신환경에 따라 발생할 수 있는 오차 있는 위치정보를 이용함으로써 이용자 및 제3자가 입은 손해에 대하여는 배상하지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 13조
                
                Text("제13조 (약관의 변경)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회사가 약관을 변경하고자 할 때는 사전에 공지사항을 통해 변경내용을 게시합니다. 이에 관해 가입회원이 이의를 제기할 경우 회사는 이용자에게 적절한 방법으로 약관 변경내용을 통지하였음을 확인해 주어야 합니다. 다만, 법령의 개정이나 제도의 개선 등으로 인하여 긴급히 약관을 변경 할 때는 해당 서비스를 이용하는 통신단말장치에 즉시 이를 게시하고 가입 시 등록된 회원의 전자우편 주소로 통지하여야 합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원은 제1항의 규정에 따른 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전 영업일까지 계약을 해지할 수 있습니다. 단 전단의 기간 안에 회원의 이의가 회사에 도달하지 않으면 회원이 이를 승인한 것으로 봅니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 14조
                
                Text("제14조 (분쟁의 조정)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("회사는 위치정보와 관련된 분쟁의 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 전기통신기본법의 규정에 따라 방송통신위원회에 재정을 신청하거나 정보통신망이용촉진및정보보호등에 관한 법률의 규정에 의한 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 15조
                
                Text("제15조 (사업자 정보 및 위치정보관리책임자 지정)")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text(verbatim: "회사의 상호, 주소, 전화번호 그 밖의 연락처는 다음과 같습니다.\n상호 : 마플  \n책임자전화번호: 010-9302-1189 \n이메일 주소: jcjtysnsj@naver.com")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text(verbatim: "위치정보관리책임자는 다음과 같이 지정합니다.\n[ 개인정보 처리방침 및 위치정보관리책임자 ]\n이름 : 정서영 \n직위 : 매니저, \nE-mail : jcjtysnsj@naver.com ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
        }
    }
}

#Preview {
    LocationPolicyView(path: .constant([]))
}
