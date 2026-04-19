import SwiftUI

struct DataDeletionView: View {
    let copy: AppCopy
    @Binding var deletionRequested: Bool
    @State private var confirmDeletion = false

    var body: some View {
        ZStack {
            PetQDesign.background

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(copy.dataDeletionTitle)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(PetQDesign.Palette.primary)

                        Text(copy.dataDeletionBody)
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .foregroundStyle(PetQDesign.Palette.secondary)
                            .lineSpacing(5)
                    }
                    .padding(24)
                    .background(PetQDesign.cardBackground())

                    VStack(alignment: .leading, spacing: 14) {
                        Text(deletionRequested ? "สถานะปัจจุบัน: มีการทำเครื่องหมายขอลบข้อมูลแล้ว" : "สถานะปัจจุบัน: ยังไม่มีการขอลบข้อมูล")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(PetQDesign.Palette.primary)

                        Button {
                            confirmDeletion = true
                        } label: {
                            Text(deletionRequested ? "ยืนยันอีกครั้งเพื่อลบข้อมูล" : "เริ่มขอลบข้อมูล")
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                                        .fill(PetQDesign.Palette.privacy)
                                )
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(22)
                    .background(PetQDesign.cardBackground())
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 32)
            }
        }
        .alert("ยืนยันการลบข้อมูล", isPresented: $confirmDeletion) {
            Button("ยกเลิก", role: .cancel) {
            }
            Button("ยืนยัน", role: .destructive) {
                deletionRequested = true
            }
        } message: {
            Text("สถานะนี้ใช้จำลอง flow การขอลบข้อมูลในเครื่อง เพื่อให้ผู้ใช้เห็นเส้นทางการควบคุมข้อมูลได้ชัดเจน")
        }
        .navigationTitle(copy.dataDeletionTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}
