//
//  PrivacyPolicyView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/19/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Binding var path: [PathModel]

    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 0) {
                Text("💓 개인정보처리방침")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 24)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                Text("<마플>은 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                        .weight(.semibold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                Text("<마플> 은 회사는 개인정보처리방침을 개정하는 경우 공지사항(또는 개별공지)을 통하여 공지할 것입니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                        .weight(.semibold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                Text(" 본 방침은부터 2023년 2월 24일부터 시행됩니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                        .weight(.semibold)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 1
                HStack(alignment: .top, spacing: 0) {
                    Text("1. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보의 처리 목적 : 마플은 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용 되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: -2
                HStack(alignment: .top, spacing: 0) {
                    Text("2. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보의 처리 및 보유 기간 : 회원 탈퇴 시까지 보유함. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("마플은 법령에 따른 개인정보 보유·이용기간 또는 정보 주체로부터 개인정보 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리 및 보유합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("각각의 개인정보 처리 및 보유 기간은 회원 탈퇴 시까지입니다. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                // MARK: - 3
                HStack(alignment: .top, spacing: 0) {
                    Text("3. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("정보 주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보 주체로서 다음과 같은 권리를 행사할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("정보주체는 마플에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("제1항에 따른 권리 행사는 마플에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 마플은 이에 대해 지체 없이 조치하겠습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("④ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑤ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시 되어 있는 경우에는 그 삭제를 요구할 수 없습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑥ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("마플은 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                // MARK: - 4
                
                HStack(alignment: .top, spacing: 0) {
                    Text("4. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("처리하는 개인정보의 항목 작성 : 마플은 다음의 개인정보 항목을 처리하고 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보의 파기 : 마플은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다. 파기절차이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.파기기한이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항 : 마플은 정보주체의 이용정보를 저장하고 수시로 불러오는 '쿠키'를 사용하지 않습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
            
                
                // MARK: - 5
                HStack(alignment: .top, spacing: 0) {
                    Text("5. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보 보호책임자 작성")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text(verbatim: "마플은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. \n▶ 개인정보 보호책임자성명 :정서영  \n직책 : 매니저  \n연락처 :010-9302-1189, jcjtysnsj@naver.com")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("정보주체께서는 마플의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 마플은 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                // MARK: - 6
                HStack(alignment: .top, spacing: 0) {
                    Text("6. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보 처리방침 변경 : 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보의 안전성 확보 조치: 마플은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보 취급 직원의 최소화 및 교육개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("개인정보에 대한 접근 제한개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BasicBackButton(path: $path)
            }
        }
    }
}

#Preview {
    PrivacyPolicyView(path: .constant([]))
}
