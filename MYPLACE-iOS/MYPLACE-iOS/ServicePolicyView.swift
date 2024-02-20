//
//  ServicePolicyView.swift
//  MYPLACE-iOS
//
//  Created by 김민지 on 2/19/24.
//

import SwiftUI

struct ServicePolicyView: View {
    @Binding var path: [PathModel]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 0) {
                Text("🏦 마플 서비스 이용약관")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 24)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                // MARK: - 제 1조
                Text("제1조 목적")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("본 이용약관은 ‘마플’의 서비스의 이용 조건과 운영에 관한 제반사항 규정을 목적으로 합니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 2조
                Text("제2조 용어의 정의")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("본 약관에서 사용 되는 주요한 용어의 정의는 다음과 같습니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)

                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원 : 마플의 약관에 동의하고 개인정보를 제공하여 회원 등록을 한 자로서, 마플과의 이용 계약을 체결하고 마플을 이용하는 이용자를 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("이용 계약 : 서비스 이용과 관련하여 마플과 회원 간에 체결 하는 계약을 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원 아이디(이하 \"닉네임\") : 회원의 식별과 회원의 서비스 이용을 위하여 회원 별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("④ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("비밀번호 : 회원이 부여 받은 ID와 일치된 회원임을 확인하고 회원의 권익 보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑤ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자 : 서비스를 운영하는 운영자를 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑥ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("해지 : 회원이 이용 계약을 해약하는 것을 말합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)

                
                // MARK: - 제 3조
                Text("제3조 약관 외 준칙")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("운영자는 필요한 경우 별도로 운영 정책을 공지 안내할 수 있으며, 본 약관과 운영 정책이 중첩될 경우 운영 정책이 우선 적용됩니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 4조
                Text("제4조 이용 계약 체결")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("이용 계약은 회원으로 등록하여 서비스를 이용하려는 자의 본 약관 내용에 대한 동의와 가입 신청에 대하여 운영자의 이용 승낙으로 성립합니다. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원으로 등록하여 서비스를 이용하려는 자는 가입 신청 시 본 약관을 읽고 \"가입 버튼\"을 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 5조
                Text("제5조 서비스 이용 신청")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원으로 등록하여 서비스를 이용하려는 이용자는 서비스에서 요청하는 제반정보(소셜 계정, 닉네임, 프로필 이미지 등)를 제공해야 합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 서비스 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 6조
                Text("제6조 개인정보처리방침")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                Text("마플 및 운영자는 회원가입 시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 마플의 개인정보처리방침을 따릅니다. 운영자는 관계 법령이 정하는 바에 따라 회원 등록 정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다. 회원의 개인정보보호에 관하여 관계 법령 및 마플이 정하는 개인정보처리방침에 정한 바에 따릅니다..")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                Text("단, 회원의 귀책 사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다. 운영자는 회원이 미풍양속에 저해되거나 국가 안보에 위배되는 게시물 등 위법한 게시물을 등록 · 배포할 경우 관련 기관의 요청이 있을 시 회원의 자료를 열람 및 해당 자료를 관련 기관에 제출할 수 있습니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 7조
                Text("제7조 운영자의 의무")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 이용 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 가급적 빨리 처리하여야 합니다. 다만, 개인적인 사정으로 신속한 처리가 곤란한 경우에는 사후에 공지 또는 이용 회원에게 쪽지, 전자 우편 등을 보내는 등 최선을 다합니다. ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 계속적이고 안정적인 서비스 제공을 위하여 설비에 장애가 생기거나 유실된 때에는 이를 지체 없이 수리 또는 복구할 수 있도록 노력합니다. 다만, 천재지변 또는 마플 운영자에 부득이한 사유가 있는 경우, 서비스 운영을 일시 정지할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 8조
                Text("제8조 회원의 의무")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원은 본 약관에서 규정하는 사항과 운영자가 정한 제반 규정, 공지사항 및 운영 정책 등 마플이 공지하는 사항 및 관계 법령을 준수하여야 하며, 기타 마플의 업무에 방해가 되는 행위, 마플의 명예를 손상시키는 행위를 해서는 안됩니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원은 마플의 명시적 동의가 없는 한 서비스의 이용 권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("이용고객은 아이디 및 비밀번호 관리에 상당한 주의를 기울여야 하며, 운영자나 마플의 동의 없이 제 3자에게 아이디를 제공하여 이용하게 할 수 없습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("④ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원은 운영자와 마플 및 제 3자의 지적 재산권을 침해해서는 안됩니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 9조
                Text("제9조 서비스 이용 시간")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("서비스 이용 시간은 업무 상 또는 기술 상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 단, 마플은 시스템 정기 점검, 증설 및 교체를 위해 마플이 정한 날이나 시간에 서비스를 일시 중단할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사전에 공지하오니 수시로 참고하시길 바랍니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("단, 마플은 다음 경우에 대하여 사전 공지나 예고없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우")
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
                    Text("전항에 의한 서비스 중단의 경우 가슴속 3천원은 사전에 공지사항 등을 통하여 회원에게 통지 합니다. 단, 마플이 통제할 수 없는 사유로 발생한 서비스의 중단에 대하여 사전 공지가 불가능한 경우에는 사후 공지로 대신합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 10조
                Text("제10조 서비스 이용 해지")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원이 마플과의 이용 계약을 해지하고자 하는 경우에는 회원 본인이 앱을 통하여 회원 탈퇴 신청을 하여야 합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("해지와 동시에 마플과 관련된 회원 정보가 자동적으로 삭제됨으로 운영자는 더 이상 해지 신청자의 정보를 볼 수 없습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
            
                
                // MARK: - 제 11조
                Text("제11조 서비스 이용 제한")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("회원은 다음 각 호에 해당하는 행위를 하여서는 아니되며 해당 행위를 한 경우에 마플은 회원의 서비스 이용 제한 및 적법한 조치를 취할 수 있으며 이용 계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원 가입 시 혹은 가입 후 정보 변경시 허위 내용을 등록하는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("타인의 서비스 이용을 방해하거나 정보를 도용하는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("마플의 운영진, 직원 또는 관계자를 사칭하는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("④ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("마플, 기타 제 3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑤ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("다른 회원의 ID를 부정하게 사용하는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑥ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑦ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("범죄와 결부된다고 객관적으로 판단되는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑧ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("기타 관련 법령에 위배되는 행위")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 12조
                Text("제12조 게시물의 관리")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("마플의 게시물과 자료의 관리 및 운영의 책임은 운영자에게 있습니다. 운영자는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 주어야 합니다. 한편, 이용 회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으니 회원 스스로 본 이용약관에서 위배되는 게시물은 게재해서는 안됩니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 운영자는 회원의 사전동의 없이 게시물을 삭제하거나 이동할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("불량게시물의 판단기준은 다음과 같습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("불법 복제 또는 해킹을 조장하는 내용인 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("영리를 목적으로 하는 광고일 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("범죄와 결부된다고 객관적으로 인정되는 내용일 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("다른 이용자 또는 제 3자와 저작권 등 기타 권리를 침해하는 경우")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 24)
                HStack(alignment: .top, spacing: 0) {
                    Text("• ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("기타 관계법령에 위배된다고 판단되는 경우")
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
                    Text("마플 및 운영자는 게시물 등에 대하여 제 3자로부터 명예 훼손, 지적재산권 등의 권리 침해를 이유로 게시 중단 요청을 받은 경우 이를 임시로 게시중단(전송 중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련 기관의 결정 등이 이루어져 가슴속 3천원에 접수된 경우 이에 따릅니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
            
                
                // MARK: - 제 13조
                Text("제13조 게시물의 보관")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                Text("마플 운영자가 불가피한 사정으로 본 마플을 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 취하기 위해 노력합니다.")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 16)
                    )
                .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                .padding(.top, 10)
                .padding(.leading, 12)
                
                // MARK: - 제 14조
                Text("제14조 게시물에 대한 저작권")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 또한 마플은 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없습니다. 다만 비영리 목적인 경우는 그러하지 아니하며, 또한 서비스 내의 게재권을 갖습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원이 게시하거나 등록하는 서비스 내의 내용물, 게시 내용에 대해 제12조 각 호에 해당된다고 판단되는 경우 사전 통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
               
                
                // MARK: - 제 15조
                Text("제15조 손해배상")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("본 서비스에서 발생한 모든 민,형법상 책임은 회원 본인에게 1차적으로 있습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 하지 않습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                // MARK: - 제 16조
                Text("제16조 면책")
                    .font(
                        .custom("Apple SD Gothic Neo", size: 20)
                        .weight(.heavy)
                    )
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 16)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("① ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원이 마플의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("② ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 본 서비스 기반 및 타 통신업자가 제공하는 전기통신서비스의 장애로 인한 경우에는 책임이 면제되며 본 서비스 기반과 관련되어 발생한 손해에 대해서는 서비스의 이용약관에 준합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                HStack(alignment: .top, spacing: 0) {
                    Text("③ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("④ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원의 귀책 사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑤ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원 상호 간 또는 회원과 제 3자 상호 간, 기타 회원의 본 서비스 내외를 불문한 일체의 활동(데이터 전송, 기타 커뮤니티 활동 포함)에 대하여 책임을 지지 않습니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑥ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원이 게시 또는 전송한 자료 및 본 서비스로 회원이 제공 받을 수 있는 모든 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑦ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원 상호 간 또는 회원과 제3자 상호 간에 서비스를 매개로 하여 물품 거래 등을 한 경우에 그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑧ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 회원 간 또는 회원과 제 3자 간에 발생한 일체의 분쟁에 대하여 책임지지 아니합니다.")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                }
                    .foregroundStyle(Color(red: 0.15, green: 0.16, blue: 0.17))
                    .padding(.top, 10)
                    .padding(.leading, 12)
                
                HStack(alignment: .top, spacing: 0) {
                    Text("⑨ ")
                        .font(
                            .custom("Apple SD Gothic Neo", size: 16)
                        )
                    Text("운영자는 서버 등 설비의 관리, 점검, 보수, 교체 과정 또는 소프트웨어의 운용 과정에서 고의 또는 고의에 준하는 중대한 과실 없이 발생할 수 있는 시스템의 장애, 제 3자의 공격으로 인한 시스템의 장애, 국내 외의 저명한 연구 기관이나 보안 관련 업체에 의해 대응 방법이 개발되지 아니한 컴퓨터 바이러스 등의 유포나 기타 운영자가 통제할 수 없는 불가항력적 사유로 인한 회원의 손해에 대하여 책임지지 않습니다.")
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
    ServicePolicyView(path: .constant([]))
}
