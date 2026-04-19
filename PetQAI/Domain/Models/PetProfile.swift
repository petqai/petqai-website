import Foundation

struct PetProfile: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var species: String
    var age: Int
    var weight: String
    var notes: String
    var isVaccinated: Bool
    var isNeutered: Bool
    var updatedAt: Date

    static let empty = PetProfile(
        id: UUID(),
        name: "",
        species: "แมว",
        age: 1,
        weight: "",
        notes: "",
        isVaccinated: false,
        isNeutered: false,
        updatedAt: .now
    )

    var displayName: String {
        name.isEmpty ? "ยังไม่ได้ตั้งชื่อสัตว์เลี้ยง" : name
    }

    var ageText: String {
        age == 0 ? "น้อยกว่า 1 ปี" : "\(age) ปี"
    }
}
