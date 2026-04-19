import Foundation

struct DefaultPetQSafetyPolicy: PetQSafetyPolicy {
    let allowedScope = [
        "Pet-related questions",
        "Pet care",
        "Pet profiles",
        "Pet wellness",
        "Pet safety"
    ]
    let canAnswerPetQuestions = true
    let allowsBackendAccess = false
    let allowsTokenApproval = false
    let allowsMedicalDiagnosis = false
    let allowsMedicationPrescriptions = false
    let allowsEmergencyCertaintyClaims = false
    let prioritizesPrivacy = true
    let requiresUserControl = true

    func isRequestWithinScope(_ request: String) -> Bool {
        let normalizedRequest = request.trimmingCharacters(in: .whitespacesAndNewlines)

        if normalizedRequest.isEmpty {
            return true
        }

        let petKeywords = [
            "pet", "dog", "cat", "puppy", "kitten", "animal",
            "care", "profile", "wellness", "safety", "feeding",
            "behavior", "grooming", "training",
            "สัตว์เลี้ยง", "หมา", "สุนัข", "แมว", "ลูกสุนัข", "ลูกแมว",
            "ดูแล", "โปรไฟล์", "สุขภาพ", "สุขภาวะ", "ความปลอดภัย",
            "อาหาร", "พฤติกรรม", "ขน", "ฝึก"
        ]

        let lowercasedRequest = normalizedRequest.lowercased()
        return petKeywords.contains { lowercasedRequest.contains($0) }
    }

    func isEmergencyRisk(_ request: String) -> Bool {
        let normalizedRequest = request.lowercased()

        let emergencyKeywords = [
            "emergency",
            "poison", "poisoning", "toxic", "toxicity",
            "seizure", "seizures", "convulsion",
            "breathing", "can't breathe", "cannot breathe", "shortness of breath",
            "bleeding", "blood loss", "hemorrhage",
            "collapse", "collapsed", "unconscious",
            "risky symptoms", "urgent",
            "ฉุกเฉิน", "สารพิษ", "พิษ", "ชัก", "หายใจ", "หายใจลำบาก",
            "เลือดออก", "หมดสติ", "ล้ม", "ทรุด"
        ]

        return emergencyKeywords.contains { normalizedRequest.contains($0) }
    }
}
