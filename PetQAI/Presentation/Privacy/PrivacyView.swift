import SwiftUI

struct PrivacyView: View {
    @ObservedObject var consentViewModel: ConsentViewModel

    @AppStorage("privacy_analytics_enabled") private var analyticsEnabled = false
    @AppStorage("privacy_local_only_mode") private var localOnlyMode = true
    @AppStorage("privacy_share_pet_profile") private var sharePetProfile = false
    @AppStorage("privacy_crash_logs_enabled") private var crashLogsEnabled = false
    @AppStorage("privacy_deletion_requested") private var deletionRequested = false

    var body: some View {
        ZStack {
            PetQDesign.background

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    hero
                    consentSummary
                    controlCard
                    routesCard
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 32)
            }
        }
        .navigationTitle("ความเป็นส่วนตัว")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension PrivacyView {
    var hero: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Privacy")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.4)
                .foregroundStyle(PetQDesign.Palette.privacy)

            Text("การควบคุมข้อมูลควรรู้สึกชัดเจนและสบายใจ")
                .font(.system(size: 29, weight: .bold, design: .rounded))
                .tracking(-0.8)
                .foregroundStyle(PetQDesign.Palette.primary)
                .fixedSize(horizontal: false, vertical: true)

            Text("หน้านี้เปิดให้คุณปรับค่าความเป็นส่วนตัวในเครื่องได้จริง พร้อมมีเส้นทางอ่านรายละเอียดและขอลบข้อมูลอย่างเป็นขั้นตอน")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.secondary)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(24)
        .background(PetQDesign.cardBackground())
    }

    var consentSummary: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Consent summary")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.3)
                .foregroundStyle(PetQDesign.Palette.secondary)

            ForEach(consentViewModel.consentItems, id: \.self) { item in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(PetQDesign.Palette.privacy)
                        .padding(.top, 1)

                    Text(item)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(22)
        .background(PetQDesign.cardBackground())
    }

    var controlCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Controls")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.3)
                .foregroundStyle(PetQDesign.Palette.secondary)

            Toggle("ใช้โหมด local-first เท่านั้น", isOn: $localOnlyMode)
                .tint(PetQDesign.Palette.privacy)

            Toggle("อนุญาตการแชร์ข้อมูลโปรไฟล์สัตว์เลี้ยงในเครื่อง", isOn: $sharePetProfile)
                .tint(PetQDesign.Palette.privacy)

            Toggle("อนุญาตเก็บ crash logs ในเครื่อง", isOn: $crashLogsEnabled)
                .tint(PetQDesign.Palette.privacy)

            Toggle("เปิด analytics", isOn: $analyticsEnabled)
                .tint(PetQDesign.Palette.privacy)

            Text("ค่าเหล่านี้ถูกเก็บไว้ในเครื่องเท่านั้น และตั้งต้นให้สอดคล้องกับแนวทาง local-first ของแอป")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundStyle(PetQDesign.Palette.primary)
        .padding(22)
        .background(PetQDesign.cardBackground())
    }

    var routesCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Routes")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.3)
                .foregroundStyle(PetQDesign.Palette.secondary)

            NavigationLink {
                ConsentView(viewModel: consentViewModel, copy: .thai)
            } label: {
                routeRow(title: "จัดการความยินยอม", subtitle: "ดูรายการข้อกำหนดและขอบเขตการยินยอม")
            }

            NavigationLink {
                PrivacyNoticeView(copy: .thai)
            } label: {
                routeRow(title: "อ่านประกาศความเป็นส่วนตัว", subtitle: "ดูคำอธิบายการใช้งานข้อมูลในรูปแบบที่อ่านง่าย")
            }

            NavigationLink {
                DataDeletionView(copy: .thai, deletionRequested: $deletionRequested)
            } label: {
                routeRow(title: "ขอลบข้อมูล", subtitle: deletionRequested ? "มีการทำเครื่องหมายขอลบข้อมูลแล้ว" : "เริ่มกระบวนการลบข้อมูลในเครื่อง")
            }
        }
        .buttonStyle(.plain)
        .padding(22)
        .background(PetQDesign.cardBackground())
    }

    func routeRow(title: String, subtitle: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "chevron.right.circle.fill")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(PetQDesign.Palette.privacy)
                .padding(.top, 1)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundStyle(PetQDesign.Palette.primary)

                Text(subtitle)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundStyle(PetQDesign.Palette.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }

            Spacer()
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white.opacity(0.70))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.78), lineWidth: 1)
        )
    }
}
