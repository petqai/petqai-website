import Foundation

struct ChatUseCaseResult {
    let responseText: String
    let wasBlocked: Bool
}

struct SendChatMessageUseCase {
    private let guardrailEngine: ChatGuardrailEngine
    private let repository: ChatRepository
    private let safeResponseFactory: SafeResponseTemplateFactory

    init(
        guardrailEngine: ChatGuardrailEngine,
        repository: ChatRepository,
        safeResponseFactory: SafeResponseTemplateFactory
    ) {
        self.guardrailEngine = guardrailEngine
        self.repository = repository
        self.safeResponseFactory = safeResponseFactory
    }

    func execute(_ request: String) -> ChatUseCaseResult {
        switch guardrailEngine.evaluate(request) {
        case .allow:
            return ChatUseCaseResult(
                responseText: repository.reply(to: request),
                wasBlocked: false
            )
        case .block(let scenario):
            return ChatUseCaseResult(
                responseText: safeResponseFactory.makeResponse(for: scenario),
                wasBlocked: true
            )
        }
    }
}
