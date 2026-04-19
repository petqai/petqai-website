import SwiftUI

struct ConsentView: View {
    @ObservedObject var viewModel: ConsentViewModel
    let copy: AppCopy

    var body: some View {
        ZStack {
            PetQDesign.background

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(copy.consentTitle)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(PetQDesign.Palette.primary)

                        Text("สรุปรายการที่เกี่ยวข้องกับความยินยอม เพื่อช่วยให้ผู้ใช้เข้าใจขอบเขตการควบคุมข้อมูลได้รวดเร็วขึ้น")
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .foregroundStyle(PetQDesign.Palette.secondary)
                            .lineSpacing(5)
                    }
                    .padding(24)
                    .background(PetQDesign.cardBackground())

                    VStack(alignment: .leading, spacing: 14) {
                        ForEach(viewModel.consentItems, id: \.self) { item in
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "checkmark.shield.fill")
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
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 32)
            }
        }
        .navigationTitle(copy.consentTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}
