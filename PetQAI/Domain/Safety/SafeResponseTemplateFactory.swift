import Foundation

enum SafeResponseScenario {
    case nonPetRequest
    case tokenRequest
    case medicalConcern
    case emergencyEscalation
    case unsupportedAction
}

struct SafeResponseTemplateFactory {
    func makeResponse(for scenario: SafeResponseScenario) -> String {
        switch scenario {
        case .nonPetRequest:
            return "PetQ AI ขอช่วยดูแลได้เฉพาะเรื่องเกี่ยวกับสัตว์เลี้ยง เช่น การดูแล โปรไฟล์ สุขภาวะ และความปลอดภัยของสัตว์เลี้ยงนะคะ ลองถามใหม่ในขอบเขตนี้ได้เสมอ"
        case .tokenRequest:
            return "เพื่อความปลอดภัยของคุณและสัตว์เลี้ยง PetQ AI ไม่สามารถอนุมัติการเข้าถึง API โทเคน หรือข้อมูลรับรองที่มีความอ่อนไหวได้ค่ะ"
        case .medicalConcern:
            return "PetQ AI ไม่สามารถวินิจฉัยโรค สั่งยา หรือยืนยันภาวะฉุกเฉินแทนสัตวแพทย์ได้ค่ะ หากสัตว์เลี้ยงแสนรักของคุณมีอาการผิดปกติ ควรติดต่อสัตวแพทย์ที่ได้รับใบอนุญาตโดยเร็ว"
        case .emergencyEscalation:
            return "กรณีนี้อาจเป็นเหตุเร่งด่วนด้านความปลอดภัยของสัตว์เลี้ยงนะคะ หากมีอาการได้รับสารพิษ ชัก หายใจลำบาก เลือดออก หมดสติ หรืออาการเสี่ยงอื่น ๆ ควรรีบพาไปพบสัตวแพทย์หรือโรงพยาบาลสัตว์ฉุกเฉินทันที"
        case .unsupportedAction:
            return "เพื่อดูแลความปลอดภัย ความเป็นส่วนตัว และการควบคุมโดยผู้ใช้ ระบบต้นแบบภายในเครื่องนี้จึงขอปฏิเสธคำขอที่อยู่นอกขอบเขตค่ะ"
        }
    }
}
