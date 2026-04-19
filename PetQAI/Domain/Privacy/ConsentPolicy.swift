import Foundation

protocol ConsentPolicy {
    var requiresExplicitUserConsent: Bool { get }
    var coversPersonalData: Bool { get }
    var coversPetData: Bool { get }
    var reservesPrivacyNoticeFlow: Bool { get }
    var reservesDataDeletionFlow: Bool { get }
}
