import Foundation

final class ChatViewModel: ObservableObject {
    @Published var draftMessage = ""
    @Published var messages: [ChatMessage]
    @Published var lastGuardrailStatus: String

    let copy: AppCopy

    private let sendChatMessageUseCase: SendChatMessageUseCase

    init(sendChatMessageUseCase: SendChatMessageUseCase, copy: AppCopy) {
        self.sendChatMessageUseCase = sendChatMessageUseCase
        self.copy = copy
        self.lastGuardrailStatus = copy.guardrailSafeLabel
        self.messages = [
            ChatMessage(role: .assistant, text: copy.mockWelcomeMessage)
        ]
    }

    func sendMessage() {
        let trimmedMessage = draftMessage.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedMessage.isEmpty else {
            lastGuardrailStatus = copy.guardrailBlockedLabel
            return
        }

        messages.append(ChatMessage(role: .user, text: trimmedMessage))

        let result = sendChatMessageUseCase.execute(trimmedMessage)
        lastGuardrailStatus = result.wasBlocked ? copy.guardrailBlockedLabel : copy.guardrailSafeLabel
        messages.append(ChatMessage(role: .assistant, text: result.responseText))
        draftMessage = ""
    }
}
