import Foundation

enum AppLanguage: String {
    case thai = "th"
    case english = "en"
}

struct AppCopy {
    let language: AppLanguage

    static let thai = AppCopy(language: .thai)
    static let english = AppCopy(language: .english)

    let appTitle = "PetQ AI"
    let homeTitle = "หน้าหลัก"
    let heroTitle = "ผู้ช่วยดูแลสัตว์เลี้ยงแสนรักอย่างอบอุ่นและปลอดภัย"
    let heroSubtitle = "ออกแบบมาสำหรับเจ้าของสัตว์เลี้ยงในไทย เพื่อช่วยดูแลเพื่อนตัวน้อยของคุณด้วยความอ่อนโยน"

    let askAIButton = "ถาม AI"
    let petProfileButton = "โปรไฟล์สัตว์เลี้ยง"
    let privacyViewButton = "ความเป็นส่วนตัว"
    let openChatButton = "เริ่มแชตกับ AI"

    let supportBadge = "อยู่ข้าง ๆ คุณและสัตว์เลี้ยงเสมอ"
    let localeNote = "ภาษาไทยเป็นภาษาหลัก เพื่อให้ใช้งานได้อย่างสบายใจ และโครงสร้างพร้อมรองรับภาษาอังกฤษในอนาคต"

    let coreSafetyTitle = "หลักความปลอดภัย"
    let emergencyTitle = "กรณีเร่งด่วน"
    let privacyTitle = "ความยินยอมและความเป็นส่วนตัว"
    let versionOneTitle = "ขอบเขตเวอร์ชันแรก"
    let privacyHubButton = "ศูนย์ความเป็นส่วนตัว"

    let consentButton = "ระบบความยินยอม"
    let privacyNoticeButton = "ประกาศความเป็นส่วนตัว"
    let dataDeletionButton = "ลบข้อมูล"

    let emergencyFooter = "หากมีอาการเสี่ยง เช่น ได้รับสารพิษ ชัก หายใจลำบาก เลือดออก หรือหมดสติ ควรพาสัตว์เลี้ยงแสนรักไปพบสัตวแพทย์ทันที"

    let petProfileTitle = "โปรไฟล์สัตว์เลี้ยง"
    let petProfilePlaceholder = "พื้นที่นี้เตรียมไว้สำหรับข้อมูลพื้นฐานของสัตว์เลี้ยงแสนรักของคุณ"
    let petProfileBody = "พื้นที่นี้เตรียมไว้สำหรับเก็บข้อมูลพื้นฐาน ประวัติสุขภาพ และรายละเอียดการดูแลของสัตว์เลี้ยงแสนรัก ที่ผู้ใช้เลือกเก็บไว้ภายในเครื่อง"
    let petProfileConsentNote = "การเก็บหรือแสดงข้อมูลของสัตว์เลี้ยงควรเกิดขึ้นหลังจากผู้ใช้ให้ความยินยอมอย่างชัดเจน เพื่อให้คุณสบายใจทุกครั้งที่ใช้งาน"

    let privacyViewTitle = "ความเป็นส่วนตัว"
    let privacyViewPlaceholder = "พื้นที่นี้เตรียมไว้สำหรับข้อมูลความเป็นส่วนตัวและการควบคุมข้อมูลของผู้ใช้"
    let consentTitle = "ระบบความยินยอม"
    let privacyNoticeTitle = "ประกาศความเป็นส่วนตัว"
    let privacyNoticeBody = "พื้นที่นี้จะอธิบายอย่างอ่อนโยนและชัดเจนว่า ระบบใช้ข้อมูลส่วนบุคคลและข้อมูลสัตว์เลี้ยงอะไรบ้าง ใช้เพื่ออะไร และผู้ใช้ควบคุมได้อย่างไร"
    let dataDeletionTitle = "ลบข้อมูล"
    let dataDeletionBody = "พื้นที่นี้จะรองรับการตรวจสอบและลบข้อมูลส่วนบุคคลหรือข้อมูลสัตว์เลี้ยงอย่างชัดเจน พร้อมการยืนยันจากผู้ใช้ เพื่อให้คุณควบคุมข้อมูลได้ด้วยความมั่นใจ"

    let chatTitle = "ถาม AI"
    let chatSubtitle = "พื้นที่พูดคุยกับ AI แบบภายในเครื่องเท่านั้น"
    let chatInputPlaceholder = "พิมพ์ข้อความ..."
    let chatSafetyNote = "ระบบนี้เป็น AI จำลองภายในเครื่อง พร้อมกฎความปลอดภัยที่ช่วยดูแลบทสนทนาอย่างอ่อนโยน และไม่มีการเชื่อมต่อระบบหลังบ้านหรือ API ภายนอก"
    let sendButton = "ส่งข้อความ"
    let mockWelcomeMessage = "สวัสดีค่ะ ฉันพร้อมอยู่ข้าง ๆ คุณในการดูแลสัตว์เลี้ยงแสนรัก ด้วยคำแนะนำที่อ่อนโยนและปลอดภัย"
    let mockFallbackResponse = "ตอนนี้ฉันช่วยดูแลบทสนทนาในหัวข้อเกี่ยวกับสัตว์เลี้ยงได้ เช่น การดูแล พฤติกรรม สุขภาวะ และความปลอดภัยของเพื่อนตัวน้อยของคุณ"

    let guardrailSectionTitle = "กฎความปลอดภัย"
    let guardrailSafeLabel = "บทสนทนานี้อยู่ในขอบเขตที่ปลอดภัย"
    let guardrailBlockedLabel = "คำขอนี้ถูกหยุดไว้เพื่อความปลอดภัยของคุณและสัตว์เลี้ยง"
}
