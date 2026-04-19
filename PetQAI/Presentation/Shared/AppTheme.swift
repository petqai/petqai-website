import SwiftUI

enum AppTheme {
    static let backgroundTop = Color(red: 0.98, green: 0.95, blue: 0.90)
    static let backgroundBottom = Color(red: 0.95, green: 0.97, blue: 0.94)
    static let cardBackground = Color.white.opacity(0.80)
    static let cardStroke = Color(red: 0.79, green: 0.85, blue: 0.80)
    static let primaryText = Color(red: 0.19, green: 0.27, blue: 0.22)
    static let secondaryText = Color(red: 0.38, green: 0.46, blue: 0.41)
    static let accent = Color(red: 0.49, green: 0.65, blue: 0.57)
    static let accentStrong = Color(red: 0.33, green: 0.53, blue: 0.44)
    static let emergencyTint = Color(red: 0.78, green: 0.34, blue: 0.30)

    static func screenBackground() -> some View {
        LinearGradient(
            colors: [backgroundTop, backgroundBottom],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct PetQCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(18)
            .background(AppTheme.cardBackground)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(AppTheme.cardStroke, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .shadow(color: Color.black.opacity(0.04), radius: 16, x: 0, y: 8)
    }
}

extension View {
    func petQCardStyle() -> some View {
        modifier(PetQCardModifier())
    }
}

enum PetQDesign {
    enum Palette {
        static let bgTop = Color(red: 0.97, green: 0.95, blue: 0.92)
        static let bgBottom = Color(red: 0.95, green: 0.97, blue: 0.95)
        static let card = Color.white.opacity(0.78)
        static let cardStrong = Color.white.opacity(0.90)
        static let stroke = Color.white.opacity(0.74)
        static let primary = Color(red: 0.17, green: 0.22, blue: 0.20)
        static let secondary = Color(red: 0.38, green: 0.44, blue: 0.41)
        static let askAI = Color(red: 0.30, green: 0.52, blue: 0.43)
        static let profile = Color(red: 0.32, green: 0.56, blue: 0.54)
        static let privacy = Color(red: 0.73, green: 0.50, blue: 0.40)
        static let warm = Color(red: 0.97, green: 0.88, blue: 0.80)
    }

    static var background: some View {
        ZStack {
            LinearGradient(
                colors: [Palette.bgTop, Palette.bgBottom],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Circle()
                .fill(Color.white.opacity(0.34))
                .frame(width: 300, height: 300)
                .blur(radius: 44)
                .offset(x: -140, y: -260)

            Circle()
                .fill(Palette.warm.opacity(0.34))
                .frame(width: 260, height: 260)
                .blur(radius: 38)
                .offset(x: 150, y: -150)
        }
    }

    static func cardBackground(strong: Bool = false) -> some View {
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .fill(strong ? Palette.cardStrong : Palette.card)
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(Palette.stroke, lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.04), radius: 18, x: 0, y: 10)
    }

    static func statusPill(text: String, accent: Color) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundStyle(accent)
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            .background(
                Capsule(style: .continuous)
                    .fill(Color.white.opacity(0.76))
            )
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Palette.stroke, lineWidth: 1)
            )
    }

    static func tag(text: String, icon: String) -> some View {
        HStack(spacing: 7) {
            Image(systemName: icon)
                .font(.system(size: 12, weight: .bold))
            Text(text)
                .font(.system(size: 12, weight: .bold, design: .rounded))
        }
        .foregroundStyle(Palette.askAI)
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        .background(
            Capsule(style: .continuous)
                .fill(Color.white.opacity(0.80))
        )
        .overlay(
            Capsule(style: .continuous)
                .stroke(Palette.stroke, lineWidth: 1)
        )
    }

    static func appIcon(accent: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color.white, Color.white.opacity(0.82)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 62, height: 62)

            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [accent.opacity(0.22), Palette.warm.opacity(0.34)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 48, height: 48)

            Image(systemName: "pawprint.fill")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(accent)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Palette.stroke, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 18, x: 0, y: 10)
    }

    static func featureIcon(icon: String, accent: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color.white.opacity(0.98), accent.opacity(0.12)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 64, height: 64)

            Circle()
                .fill(accent.opacity(0.16))
                .frame(width: 42, height: 42)

            Image(systemName: icon)
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(accent)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(Palette.stroke, lineWidth: 1)
        )
    }
}
