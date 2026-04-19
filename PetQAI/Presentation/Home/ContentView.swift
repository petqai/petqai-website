import SwiftUI

struct ContentView: View {
    @ObservedObject var chatViewModel: ChatViewModel
    @ObservedObject var consentViewModel: ConsentViewModel
    @ObservedObject var petProfileViewModel: PetProfileViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                PetQDesign.background

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 26) {
                        topHeader
                        titleBlock
                        entryCards
                        reflectionCard
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("หน้าหลัก")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension ContentView {
    var topHeader: some View {
        HStack(spacing: 14) {
            PetQDesign.appIcon(accent: PetQDesign.Palette.askAI)

            VStack(alignment: .leading, spacing: 4) {
                Text("PetQ AI")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(PetQDesign.Palette.primary)

                Text("Calm care for pets and people")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .tracking(0.3)
                    .foregroundStyle(PetQDesign.Palette.secondary)
            }

            Spacer(minLength: 12)

            PetQDesign.statusPill(text: "พร้อมดูแล", accent: PetQDesign.Palette.askAI)
        }
    }

    var titleBlock: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Designed to feel like\na quiet check-in")
                .font(.system(size: 33, weight: .bold, design: .rounded))
                .tracking(-1)
                .foregroundStyle(PetQDesign.Palette.primary)
                .fixedSize(horizontal: false, vertical: true)

            Text("ประสบการณ์แบบ Apple Health และ Journal ที่อ่อนโยนขึ้น สบายตาขึ้น และอ่านภาษาไทยได้อย่างเป็นธรรมชาติ")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary.opacity(0.92))
                .fixedSize(horizontal: false, vertical: true)

            Text("เลือกเริ่มจากการถาม AI, ดูโปรไฟล์สัตว์เลี้ยง หรือจัดการความเป็นส่วนตัว ด้วยลำดับสายตาที่นิ่ง สะอาด และไว้ใจได้")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.secondary)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)

            HStack(spacing: 10) {
                PetQDesign.tag(text: "Thai-first", icon: "character.book.closed.fill")
                PetQDesign.tag(text: "Calm UI", icon: "leaf.fill")
                PetQDesign.tag(text: "Private", icon: "lock.fill")
            }
        }
        .padding(26)
        .background(PetQDesign.cardBackground(strong: true))
    }

    var entryCards: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Explore")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.4)
                .foregroundStyle(PetQDesign.Palette.secondary)
                .padding(.horizontal, 4)

            homeEntryCard(
                englishTitle: "Ask AI",
                thaiTitle: "ถาม AI",
                bodyText: "พูดคุยกับ AI จริงในเครื่อง พร้อม guardrail ด้านความปลอดภัยและคำแนะนำที่อ่อนโยน",
                footerText: "Start a gentle conversation",
                icon: "sparkles",
                accent: PetQDesign.Palette.askAI
            ) {
                ChatView(viewModel: chatViewModel)
            }

            homeEntryCard(
                englishTitle: "Pet Profile",
                thaiTitle: "โปรไฟล์สัตว์เลี้ยง",
                bodyText: "บันทึกข้อมูลสำคัญ สุขภาพ และข้อสังเกตประจำวันของสัตว์เลี้ยงไว้ในเครื่องแบบ local-first",
                footerText: "Keep the essentials close",
                icon: "heart.text.square.fill",
                accent: PetQDesign.Palette.profile
            ) {
                PetProfileView(viewModel: petProfileViewModel)
            }

            homeEntryCard(
                englishTitle: "Privacy",
                thaiTitle: "ความเป็นส่วนตัว",
                bodyText: "จัดการความยินยอม ค่าการใช้งานในเครื่อง และเส้นทางด้าน privacy ที่อ่านง่ายและควบคุมได้จริง",
                footerText: "Clear control over your data",
                icon: "lock.shield.fill",
                accent: PetQDesign.Palette.privacy
            ) {
                PrivacyView(consentViewModel: consentViewModel)
            }
        }
    }

    var reflectionCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("A warmer PetQ AI")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.4)
                .foregroundStyle(PetQDesign.Palette.secondary)

            Text("ความไว้วางใจเริ่มจากหน้าจอที่สงบและชัดเจน")
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary)
                .fixedSize(horizontal: false, vertical: true)

            Text("ดีไซน์ใหม่นี้ใช้พื้นผิวแบบกระดาษนุ่ม ๆ ระยะหายใจที่มากขึ้น และตอนนี้แต่ละหน้าก็เริ่มใช้งานจริงได้โดยไม่ต้องพึ่ง backend")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.secondary)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(24)
        .background(PetQDesign.cardBackground())
    }

    func homeEntryCard<Destination: View>(
        englishTitle: String,
        thaiTitle: String,
        bodyText: String,
        footerText: String,
        icon: String,
        accent: Color,
        @ViewBuilder destination: () -> Destination
    ) -> some View {
        NavigationLink {
            destination()
        } label: {
            HStack(alignment: .top, spacing: 16) {
                PetQDesign.featureIcon(icon: icon, accent: accent)

                VStack(alignment: .leading, spacing: 10) {
                    Text(englishTitle)
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .textCase(.uppercase)
                        .tracking(1.2)
                        .foregroundStyle(accent)

                    Text(thaiTitle)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.primary)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(bodyText)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.secondary)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)

                    HStack(spacing: 8) {
                        Text(footerText)
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundStyle(PetQDesign.Palette.primary.opacity(0.78))

                        Spacer(minLength: 8)

                        Label("Open", systemImage: "arrow.right")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .foregroundStyle(accent)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
            .background(PetQDesign.cardBackground())
        }
        .buttonStyle(.plain)
    }
}
