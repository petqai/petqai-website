import Foundation

struct DefaultConsentPolicy: ConsentPolicy {
    let requiresExplicitUserConsent = true
    let coversPersonalData = true
    let coversPetData = true
    let reservesPrivacyNoticeFlow = true
    let reservesDataDeletionFlow = true
}
