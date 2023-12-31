//
//  ChatListModel.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 24/12/2023.
//

import Foundation

struct ChatListModel : Identifiable,Codable{
    var id = UUID()
    var names: String
}

struct Room: Identifiable,Codable{
    let id = UUID()
    let name : String
    let created_at: Date
}
