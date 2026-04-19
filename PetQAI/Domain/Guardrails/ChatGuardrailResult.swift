import Foundation

enum ChatGuardrailResult {
    case allow
    case block(SafeResponseScenario)
}
