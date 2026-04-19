import Foundation

struct DefaultLocalFirstPolicy: LocalFirstPolicy {
    let isLocalOnly = true
    let isUIFirst = true
    let reservesBackendIntegration = true
    let reservesDatabaseWrites = true
    let reservesAnalytics = true
    let reservesPushNotifications = true
    let reservesAPIKeys = true
    let reservesExternalServices = true
}
