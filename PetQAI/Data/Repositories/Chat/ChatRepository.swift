import Foundation

protocol ChatRepository {
    func reply(to request: String) -> String
}
