import Foundation

struct LocalMockChatRepository: ChatRepository {
    func reply(to request: String) -> String {
        let lowercasedRequest = request.lowercased()

        if lowercasedRequest.contains("อาหาร") || lowercasedRequest.contains("feed") || lowercasedRequest.contains("food") {
            return "ถ้าเป็นเรื่องอาหารของสัตว์เลี้ยงแสนรัก ลองเริ่มจากดูอายุ น้ำหนัก และกิจกรรมในแต่ละวันก่อนนะคะ แล้วค่อย ๆ เลือกอาหารที่เหมาะสมและปรับอย่างอ่อนโยน"
        }

        if lowercasedRequest.contains("พฤติกรรม") || lowercasedRequest.contains("behavior") || lowercasedRequest.contains("bark") {
            return "ถ้าเป็นเรื่องพฤติกรรม ลองสังเกตสิ่งกระตุ้น ช่วงเวลาที่เกิดพฤติกรรม และกิจวัตรประจำวันของเขาก่อนนะคะ วิธีนี้จะช่วยให้คุณเข้าใจสัตว์เลี้ยงได้ลึกขึ้นอย่างอ่อนโยน"
        }

        if lowercasedRequest.contains("อาบน้ำ") || lowercasedRequest.contains("groom") {
            return "การดูแลขนและผิวหนังของเพื่อนตัวน้อยควรทำอย่างสม่ำเสมอและอ่อนโยนนะคะ เลือกผลิตภัณฑ์ที่เหมาะกับเขาและสังเกตอาการระคายเคืองเสมอ"
        }

        return "ขอบคุณที่ไว้วางใจถามนะคะ ฉันช่วยแนะนำเรื่องการดูแลสัตว์เลี้ยง พฤติกรรม สุขภาวะทั่วไป และความปลอดภัยเบื้องต้นได้อย่างอ่อนโยน ในรูปแบบทำงานภายในเครื่องเท่านั้น"
    }
}
