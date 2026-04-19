import Foundation

struct AskAIUseCase {
    private let repository: PetAIRepository
    private let safetyPolicy: PetQSafetyPolicy
    private let safeResponseFactory: SafeResponseTemplateFactory

    init(
        repository: PetAIRepository,
        safetyPolicy: PetQSafetyPolicy,
        safeResponseFactory: SafeResponseTemplateFactory
    ) {
        self.repository = repository
        self.safetyPolicy = safetyPolicy
        self.safeResponseFactory = safeResponseFactory
    }

    func execute(request: String = "") -> String {
        guard safetyPolicy.canAnswerPetQuestions else {
            return safeResponseFactory.makeResponse(for: .nonPetRequest)
        }

        guard safetyPolicy.isRequestWithinScope(request) else {
            return safeResponseFactory.makeResponse(for: .nonPetRequest)
        }

        if safetyPolicy.isEmergencyRisk(request) {
            return safeResponseFactory.makeResponse(for: .emergencyEscalation)
        }

        guard !safetyPolicy.allowsMedicalDiagnosis,
              !safetyPolicy.allowsMedicationPrescriptions,
              !safetyPolicy.allowsEmergencyCertaintyClaims else {
            return safeResponseFactory.makeResponse(for: .medicalConcern)
        }

        if !safetyPolicy.allowsBackendAccess {
            return repository.placeholderResponse()
        }

        return safeResponseFactory.makeResponse(for: .unsupportedAction)
    }
}
