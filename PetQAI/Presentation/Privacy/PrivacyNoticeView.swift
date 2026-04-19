import SwiftUI

struct PrivacyNoticeView: View {
    let copy: AppCopy

    var body: some View {
        ZStack {
            PetQDesign.background

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    Text(copy.privacyNoticeTitle)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.primary)

                    noticeSection(
                        title: "ข้อมูลที่ดูแล",
                        body: "ข้อมูลพื้นฐานของผู้ใช้ ข้อมูลสัตว์เลี้ยง และค่าการตั้งค่าความเป็นส่วนตัวที่คุณเลือกเก็บไว้ในเครื่อง"
                    )

                    noticeSection(
                        title: "วัตถุประสงค์",
                        body: "เพื่อช่วยให้การดูแลสัตว์เลี้ยงเป็นเรื่องชัดเจนขึ้น พร้อมประสบการณ์ที่สุภาพและ local-first"
                    )

                    noticeSection(
                        title: "การควบคุมโดยผู้ใช้",
                        body: copy.privacyNoticeBody
                    )
                }
                .padding(20)
            }
        }
        .navigationTitle(copy.privacyNoticeTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension PrivacyNoticeView {
    func noticeSection(title: String, body: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.3)
                .foregroundStyle(PetQDesign.Palette.secondary)

            Text(body)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(22)
        .background(PetQDesign.cardBackground())
    }
}
