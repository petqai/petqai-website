import SwiftUI

struct PetProfileView: View {
    @ObservedObject var viewModel: PetProfileViewModel

    private let speciesOptions = ["แมว", "สุนัข", "กระต่าย", "นก", "อื่น ๆ"]

    var body: some View {
        ZStack {
            PetQDesign.background

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    hero
                    summaryCard
                    detailForm
                    careNotesCard
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 32)
            }
        }
        .navigationTitle("โปรไฟล์สัตว์เลี้ยง")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension PetProfileView {
    var hero: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pet Profile")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.4)
                .foregroundStyle(PetQDesign.Palette.profile)

            Text("ข้อมูลสำคัญควรอยู่ใกล้มือเสมอ")
                .font(.system(size: 29, weight: .bold, design: .rounded))
                .tracking(-0.8)
                .foregroundStyle(PetQDesign.Palette.primary)
                .fixedSize(horizontal: false, vertical: true)

            Text("บันทึกชื่อ สายพันธุ์ อายุ น้ำหนัก และหมายเหตุสำคัญไว้ในเครื่อง เพื่อใช้อ้างอิงได้เร็วขึ้นทุกครั้งที่กลับมาใช้งาน")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.secondary)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(24)
        .background(PetQDesign.cardBackground())
    }

    var summaryCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Overview")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.3)
                .foregroundStyle(PetQDesign.Palette.secondary)

            HStack(alignment: .top, spacing: 16) {
                PetQDesign.featureIcon(icon: "heart.text.square.fill", accent: PetQDesign.Palette.profile)

                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.profile.displayName)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.primary)

                    Text("\(viewModel.profile.species) • อายุ \(viewModel.profile.ageText)")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.secondary)

                    if !viewModel.profile.weight.isEmpty {
                        Text("น้ำหนัก \(viewModel.profile.weight) กก.")
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .foregroundStyle(PetQDesign.Palette.secondary)
                    }

                    Text(viewModel.statusText)
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.profile)
                }

                Spacer()
            }
        }
        .padding(22)
        .background(PetQDesign.cardBackground())
    }

    var detailForm: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Details")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.3)
                .foregroundStyle(PetQDesign.Palette.secondary)

            formField(title: "ชื่อสัตว์เลี้ยง") {
                TextField("เช่น Mochi", text: binding(\.name))
                    .textFieldStyle(.plain)
            }

            formField(title: "ชนิดสัตว์เลี้ยง") {
                Picker("ชนิดสัตว์เลี้ยง", selection: binding(\.species)) {
                    ForEach(speciesOptions, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.segmented)
            }

            formField(title: "อายุโดยประมาณ") {
                Stepper(value: binding(\.age), in: 0...30) {
                    Text(viewModel.profile.ageText)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.primary)
                }
            }

            formField(title: "น้ำหนัก (กิโลกรัม)") {
                TextField("เช่น 4.8", text: binding(\.weight))
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.plain)
            }

            Toggle(isOn: binding(\.isVaccinated)) {
                Text("บันทึกว่าวัคซีนอัปเดตแล้ว")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundStyle(PetQDesign.Palette.primary)
            }
            .tint(PetQDesign.Palette.profile)

            Toggle(isOn: binding(\.isNeutered)) {
                Text("บันทึกสถานะทำหมันแล้ว")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundStyle(PetQDesign.Palette.primary)
            }
            .tint(PetQDesign.Palette.profile)

            HStack(spacing: 12) {
                Button(action: viewModel.resetProfile) {
                    Text("ล้างค่า")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundStyle(PetQDesign.Palette.profile)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .fill(Color.white.opacity(0.74))
                        )
                }
                .buttonStyle(.plain)

                Button(action: viewModel.saveProfile) {
                    Text("บันทึกโปรไฟล์")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .fill(PetQDesign.Palette.profile)
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(22)
        .background(PetQDesign.cardBackground())
    }

    var careNotesCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Care notes")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.3)
                .foregroundStyle(PetQDesign.Palette.secondary)

            TextEditor(text: binding(\.notes))
                .frame(minHeight: 140)
                .padding(14)
                .scrollContentBackground(.hidden)
                .background(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(Color.white.opacity(0.76))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(Color.white.opacity(0.80), lineWidth: 1)
                )

            Text("เหมาะสำหรับบันทึกอาหารที่แพ้ พฤติกรรมที่ต้องสังเกต หรือนัดหมายที่อยากจำไว้")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.secondary)
        }
        .padding(22)
        .background(PetQDesign.cardBackground())
    }

    func binding<Value>(_ keyPath: WritableKeyPath<PetProfile, Value>) -> Binding<Value> {
        Binding(
            get: { viewModel.profile[keyPath: keyPath] },
            set: { viewModel.profile[keyPath: keyPath] = $0 }
        )
    }

    func formField<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary)

            content()
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary)
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color.white.opacity(0.76))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Color.white.opacity(0.80), lineWidth: 1)
                )
        }
    }
}

protocol PetProfileStore {
    func load() throws -> PetProfile
    func save(_ profile: PetProfile) throws
}

struct LocalPetProfileStore: PetProfileStore {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func load() throws -> PetProfile {
        let url = try storageURL()
        guard FileManager.default.fileExists(atPath: url.path) else {
            return .empty
        }

        let data = try Data(contentsOf: url)
        return try decoder.decode(PetProfile.self, from: data)
    }

    func save(_ profile: PetProfile) throws {
        let url = try storageURL()
        let data = try encoder.encode(profile)
        try data.write(to: url, options: .atomic)
    }

    private func storageURL() throws -> URL {
        let baseDirectory = try FileManager.default.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        let directory = baseDirectory.appendingPathComponent("PetQAI", isDirectory: true)

        if !FileManager.default.fileExists(atPath: directory.path) {
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        }

        return directory.appendingPathComponent("pet-profile.json")
    }
}

final class PetProfileViewModel: ObservableObject {
    @Published var profile: PetProfile
    @Published var statusText: String

    private let store: PetProfileStore

    init(store: PetProfileStore) {
        self.store = store

        do {
            self.profile = try store.load()
            self.statusText = "โหลดโปรไฟล์จากไฟล์ในเครื่องแล้ว"
        } catch {
            self.profile = .empty
            self.statusText = "เริ่มต้นโปรไฟล์ใหม่ในเครื่อง"
        }
    }

    func saveProfile() {
        profile.updatedAt = .now

        do {
            try store.save(profile)
            statusText = "บันทึกโปรไฟล์ล่าสุดแล้ว"
        } catch {
            statusText = "ไม่สามารถบันทึกโปรไฟล์ได้"
        }
    }

    func resetProfile() {
        profile = .empty
        saveProfile()
        statusText = "ล้างและสร้างโปรไฟล์ใหม่แล้ว"
    }
}
