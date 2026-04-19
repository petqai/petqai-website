import Foundation

protocol LocalFirstPolicy {
    var isLocalOnly: Bool { get }
    var isUIFirst: Bool { get }
    var reservesBackendIntegration: Bool { get }
    var reservesDatabaseWrites: Bool { get }
    var reservesAnalytics: Bool { get }
    var reservesPushNotifications: Bool { get }
    var reservesAPIKeys: Bool { get }
    var reservesExternalServices: Bool { get }
}
