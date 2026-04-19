import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel

    var body: some View {
        ZStack {
            PetQDesign.background

            VStack(spacing: 0) {
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 18) {
                            hero
                            guardrailCard
                            ForEach(viewModel.messages) { message in
                                messageBubble(message)
                                    .id(message.id)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                        .padding(.bottom, 20)
                    }
                    .onChange(of: viewModel.messages.count) { _, _ in
                        if let lastID = viewModel.messages.last?.id {
                            withAnimation(.easeOut(duration: 0.25)) {
                                proxy.scrollTo(lastID, anchor: .bottom)
                            }
                        }
                    }
                }

                composer
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 16)
                    .background(Color.clear)
            }
        }
        .navigationTitle(viewModel.copy.chatTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension ChatView {
    var hero: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Ask AI")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.4)
                .foregroundStyle(PetQDesign.Palette.askAI)

            Text("พื้นที่พูดคุยที่สงบและอ่อนโยน")
                .font(.system(size: 29, weight: .bold, design: .rounded))
                .tracking(-0.8)
                .foregroundStyle(PetQDesign.Palette.primary)
                .fixedSize(horizontal: false, vertical: true)

            Text(viewModel.copy.chatSafetyNote)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.secondary)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(24)
        .background(PetQDesign.cardBackground())
    }

    var guardrailCard: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: viewModel.lastGuardrailStatus == viewModel.copy.guardrailSafeLabel ? "checkmark.shield.fill" : "exclamationmark.shield.fill")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(viewModel.lastGuardrailStatus == viewModel.copy.guardrailSafeLabel ? PetQDesign.Palette.askAI : PetQDesign.Palette.privacy)

            Text(viewModel.lastGuardrailStatus)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary)

            Spacer()
        }
        .padding(18)
        .background(PetQDesign.cardBackground())
    }

    var composer: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField(viewModel.copy.chatInputPlaceholder, text: $viewModel.draftMessage, axis: .vertical)
                .textFieldStyle(.plain)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary)
                .padding(18)
                .background(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(Color.white.opacity(0.82))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(Color.white.opacity(0.82), lineWidth: 1)
                )

            HStack {
                Text("Local-first mock experience")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(PetQDesign.Palette.secondary)

                Spacer()

                Button(action: viewModel.sendMessage) {
                    Text(viewModel.copy.sendButton)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(
                            Capsule(style: .continuous)
                                .fill(PetQDesign.Palette.askAI)
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(18)
        .background(PetQDesign.cardBackground())
    }

    func messageBubble(_ message: ChatMessage) -> some View {
        HStack {
            if message.role == .assistant {
                bubble(message.text, title: "PetQ AI", alignment: .leading, fill: Color.white.opacity(0.80), accent: PetQDesign.Palette.askAI)
                Spacer(minLength: 36)
            } else {
                Spacer(minLength: 36)
                bubble(message.text, title: "You", alignment: .trailing, fill: PetQDesign.Palette.askAI.opacity(0.14), accent: PetQDesign.Palette.askAI)
            }
        }
    }

    func bubble(_ text: String, title: String, alignment: HorizontalAlignment, fill: Color, accent: Color) -> some View {
        VStack(alignment: alignment, spacing: 6) {
            Text(title)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .textCase(.uppercase)
                .tracking(1.2)
                .foregroundStyle(accent)

            Text(text)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(PetQDesign.Palette.primary)
                .lineSpacing(5)
                .frame(maxWidth: .infinity, alignment: alignment == .leading ? .leading : .trailing)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(fill)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(Color.white.opacity(0.76), lineWidth: 1)
        )
    }
}
