import Foundation

struct Consumer: Codable, Identifiable {
    let id: UUID
    let name, address, contactInfo: String
}

struct Provider: Codable, Identifiable {
    let id: UUID
    let name, contactInfo, profession: String
    let Status: Bool
    let totalWorkTime: Int
}

struct Reviews: Codable, Identifiable {
    let id, TaskId, ConsumerId: UUID
    let Review: Int
    let ReviewFeedBack: String
}

struct Service: Codable, Identifiable {
    let id: UUID
    let serviceName, description, status, address: String
    let price: Int
}

struct Task: Codable, Identifiable {
    let id, consumerid, providerId, servicesId: UUID
    let status: String
}

//enum TaskStatus: String, Identifiable, Codable, CaseIterable {
//    case inProgress
//    case complete
//    case open
//
//    var id: String {
//        return title
//    }
//
//    var title: String {
//        switch self {
//        case .inProgress: return "In Progress"
//        case .complete: return "Complete"
//        case .open: return "Open"
//        }
//    }
//}
