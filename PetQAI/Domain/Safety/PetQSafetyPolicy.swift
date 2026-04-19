import Foundation

protocol PetQSafetyPolicy {
    var allowedScope: [String] { get }
    var canAnswerPetQuestions: Bool { get }
    var allowsBackendAccess: Bool { get }
    var allowsTokenApproval: Bool { get }
    var allowsMedicalDiagnosis: Bool { get }
    var allowsMedicationPrescriptions: Bool { get }
    var allowsEmergencyCertaintyClaims: Bool { get }
    var prioritizesPrivacy: Bool { get }
    var requiresUserControl: Bool { get }

    func isRequestWithinScope(_ request: String) -> Bool
    func isEmergencyRisk(_ request: String) -> Bool
}
