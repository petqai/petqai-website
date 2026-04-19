import Foundation

final class HomeViewModel: ObservableObject {
    @Published var statusMessage: String?
    let copy: AppCopy

    let coreRules: [String] = [
        "จำกัด AI ไว้เฉพาะคำถามเกี่ยวกับสัตว์เลี้ยง การดูแล โปรไฟล์ สุขภาวะ และความปลอดภัย",
        "หากคำขออยู่นอกขอบเขต ระบบต้องปฏิเสธหรือแนะนำกลับอย่างปลอดภัย",
        "ไม่เข้าถึงหรือแก้ไขระบบหลังบ้าน",
        "ไม่อนุมัติการเข้าถึง API หรือโทเคน",
        "ไม่วินิจฉัยโรค ไม่สั่งยา และไม่ยืนยันภาวะฉุกเฉินแทนสัตวแพทย์",
        "ใช้ข้อความตอบกลับที่ปลอดภัยในกรณีอ่อนไหว",
        "ให้ความสำคัญกับความปลอดภัย ความเป็นส่วนตัว และการควบคุมโดยผู้ใช้"
    ]

    let emergencyEscalationRules: [String] = [
        "ยกระดับอาการเสี่ยงไปยังสัตวแพทย์ทันที",
        "ถือว่าอาการได้รับสารพิษ ชัก หายใจลำบาก เลือดออก และหมดสติ เป็นเรื่องเร่งด่วน"
    ]

    let privacyRules: [String] = [
        "ข้อมูลส่วนบุคคลและข้อมูลสัตว์เลี้ยงต้องได้รับความยินยอมอย่างชัดเจน",
        "โครงสร้างแอปรองรับระบบความยินยอม ประกาศความเป็นส่วนตัว และการลบข้อมูล",
        "คงสิทธิการควบคุมข้อมูลไว้กับผู้ใช้เป็นหลัก"
    ]

    let versionOneRules: [String]

    private let askAIUseCase: AskAIUseCase
    let consentViewModel: ConsentViewModel
    let chatViewModel: ChatViewModel

    init(
        askAIUseCase: AskAIUseCase,
        consentViewModel: ConsentViewModel,
        localFirstPolicy: LocalFirstPolicy,
        chatViewModel: ChatViewModel
    ) {
        self.copy = .thai
        self.askAIUseCase = askAIUseCase
        self.consentViewModel = consentViewModel
        self.chatViewModel = chatViewModel
        self.versionOneRules = [
            localFirstPolicy.isLocalOnly ? "เวอร์ชันแรกทำงานภายในเครื่องเท่านั้น" : "ปิดโหมดภายในเครื่องเท่านั้น",
            localFirstPolicy.isUIFirst ? "ให้ความสำคัญกับส่วนติดต่อผู้ใช้เป็นอันดับแรก" : "ปิดแนวทางส่วนติดต่อผู้ใช้เป็นอันดับแรก",
            localFirstPolicy.reservesBackendIntegration ? "ยังไม่เพิ่มการเชื่อมต่อระบบหลังบ้านจนกว่าจะมีคำขอชัดเจน" : "เปิดการเชื่อมต่อระบบหลังบ้าน",
            localFirstPolicy.reservesDatabaseWrites ? "ยังไม่เพิ่มการเขียนฐานข้อมูล" : "เปิดการเขียนฐานข้อมูล",
            localFirstPolicy.reservesAnalytics ? "ยังไม่เพิ่มระบบวิเคราะห์ข้อมูล" : "เปิดระบบวิเคราะห์ข้อมูล",
            localFirstPolicy.reservesPushNotifications ? "ยังไม่เพิ่มการแจ้งเตือนแบบพุช" : "เปิดการแจ้งเตือนแบบพุช",
            localFirstPolicy.reservesAPIKeys ? "ยังไม่เพิ่มคีย์ API" : "เปิดคีย์ API",
            localFirstPolicy.reservesExternalServices ? "ยังไม่เพิ่มบริการภายนอก" : "เปิดบริการภายนอก"
        ]
    }

    func askAI() {
        statusMessage = askAIUseCase.execute()
    }
}
