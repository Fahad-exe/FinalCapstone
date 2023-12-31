//
//  MessageModel.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 27/12/2023.
//

import SwiftUI

struct MessageModel: Identifiable,Codable {
    var id = UUID()
    let roomId : UUID
    let UserId: UUID
    let context: String
}


