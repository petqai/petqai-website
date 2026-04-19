import SwiftUI

@main
struct PetQAIApp: App {
    @StateObject private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView(
                chatViewModel: appModel.chatViewModel,
                consentViewModel: appModel.consentViewModel,
                petProfileViewModel: appModel.petProfileViewModel
            )
        }
    }
}

private final class AppModel: ObservableObject {
    let chatViewModel: ChatViewModel
    let consentViewModel: ConsentViewModel
    let petProfileViewModel: PetProfileViewModel

    init() {
        let copy = AppCopy.thai
        let safetyPolicy = DefaultPetQSafetyPolicy()
        let safeResponseFactory = SafeResponseTemplateFactory()
        let chatRepository = LocalMockChatRepository()
        let guardrailEngine = ChatGuardrailEngine(safetyPolicy: safetyPolicy)
        let sendChatMessageUseCase = SendChatMessageUseCase(
            guardrailEngine: guardrailEngine,
            repository: chatRepository,
            safeResponseFactory: safeResponseFactory
        )

        self.chatViewModel = ChatViewModel(
            sendChatMessageUseCase: sendChatMessageUseCase,
            copy: copy
        )
        self.consentViewModel = ConsentViewModel(consentPolicy: DefaultConsentPolicy())
        self.petProfileViewModel = PetProfileViewModel(store: LocalPetProfileStore())
    }
}
