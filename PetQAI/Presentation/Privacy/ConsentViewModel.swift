import Foundation

final class ConsentViewModel: ObservableObject {
    let consentItems: [String]

    init(consentPolicy: ConsentPolicy) {
        consentItems = [
            consentPolicy.requiresExplicitUserConsent ? "ข้อมูลส่วนบุคคลและข้อมูลสัตว์เลี้ยงต้องได้รับความยินยอมอย่างชัดเจน" : "ไม่ได้กำหนดให้ใช้ความยินยอม",
            consentPolicy.coversPersonalData ? "เตรียมโฟลว์ความยินยอมสำหรับข้อมูลส่วนบุคคลแล้ว" : "ยังไม่ได้เตรียมโฟลว์ข้อมูลส่วนบุคคล",
            consentPolicy.coversPetData ? "เตรียมโฟลว์ความยินยอมสำหรับข้อมูลสัตว์เลี้ยงแล้ว" : "ยังไม่ได้เตรียมโฟลว์ข้อมูลสัตว์เลี้ยง",
            consentPolicy.reservesPrivacyNoticeFlow ? "เตรียมพื้นที่สำหรับประกาศความเป็นส่วนตัวแล้ว" : "ยังไม่ได้เตรียมประกาศความเป็นส่วนตัว",
            consentPolicy.reservesDataDeletionFlow ? "เตรียมพื้นที่สำหรับการลบข้อมูลแล้ว" : "ยังไม่ได้เตรียมการลบข้อมูล"
        ]
    }
}
