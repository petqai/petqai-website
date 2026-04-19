import SwiftUI

struct PrivacyHubView: View {
    let copy: AppCopy
    let consentViewModel: ConsentViewModel
    @State private var deletionRequested = false

    var body: some View {
        ZStack {
            AppTheme.screenBackground()

            VStack(alignment: .leading, spacing: 16) {
                Text(copy.privacyTitle)
                    .font(.system(.title2, design: .rounded).weight(.bold))
                    .foregroundStyle(AppTheme.primaryText)

                Text("พื้นที่นี้รวมเส้นทางด้านความยินยอม ความเป็นส่วนตัว และการลบข้อมูลไว้ในที่เดียว เพื่อให้ผู้ใช้เข้าถึงและควบคุมข้อมูลได้ง่าย")
                    .font(.body)
                    .foregroundStyle(AppTheme.secondaryText)
                    .multilineTextAlignment(.leading)

                NavigationLink {
                    ConsentView(viewModel: consentViewModel, copy: copy)
                } label: {
                    Text(copy.consentButton)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(AppTheme.accentStrong)

                NavigationLink {
                    PrivacyNoticeView(copy: copy)
                } label: {
                    Text(copy.privacyNoticeButton)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(AppTheme.accentStrong)

                NavigationLink {
                    DataDeletionView(copy: copy, deletionRequested: $deletionRequested)
                } label: {
                    Text(copy.dataDeletionButton)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(AppTheme.accentStrong)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .petQCardStyle()
            .padding()
        }
        .navigationTitle(copy.privacyTitle)
    }
}
