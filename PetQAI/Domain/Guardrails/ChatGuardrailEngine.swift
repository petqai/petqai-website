import Foundation

struct ChatGuardrailEngine {
    private let safetyPolicy: PetQSafetyPolicy

    init(safetyPolicy: PetQSafetyPolicy) {
        self.safetyPolicy = safetyPolicy
    }

    func evaluate(_ request: String) -> ChatGuardrailResult {
        let normalizedRequest = request.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !normalizedRequest.isEmpty else {
            return .block(.unsupportedAction)
        }

        let lowercasedRequest = normalizedRequest.lowercased()

        if containsTokenRequest(lowercasedRequest) {
            return .block(.tokenRequest)
        }

        guard safetyPolicy.isRequestWithinScope(normalizedRequest) else {
            return .block(.nonPetRequest)
        }

        if safetyPolicy.isEmergencyRisk(normalizedRequest) {
            return .block(.emergencyEscalation)
        }

        if containsMedicalOrMedicationRequest(lowercasedRequest) {
            return .block(.medicalConcern)
        }

        return .allow
    }

    private func containsTokenRequest(_ request: String) -> Bool {
        let blockedKeywords = [
            "api key", "apikey", "token", "access key", "credential",
            "secret", "oauth", "backend", "database", "analytics",
            "push notification", "external service",
            "กุญแจ api", "คีย์", "โทเคน", "รหัสลับ", "ระบบหลังบ้าน",
            "ฐานข้อมูล", "แอนะลิติก", "แจ้งเตือน", "บริการภายนอก"
        ]

        return blockedKeywords.contains { request.contains($0) }
    }

    private func containsMedicalOrMedicationRequest(_ request: String) -> Bool {
        let blockedKeywords = [
            "diagnose", "diagnosis", "prescribe", "prescription",
            "medication", "medicine", "drug", "dose", "dosage",
            "emergency certainty", "guarantee emergency",
            "วินิจฉัย", "สั่งยา", "ยา", "ขนาดยา", "โดส", "ฉุกเฉินแน่",
            "ยืนยันฉุกเฉิน"
        ]

        return blockedKeywords.contains { request.contains($0) }
    }
}
