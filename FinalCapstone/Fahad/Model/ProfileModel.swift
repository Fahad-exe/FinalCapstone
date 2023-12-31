//
//  ProfileData.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 23/12/2023.
//

import Foundation
import SwiftUI

public struct ProfileModel: Identifiable {
   public var id = UUID()
    var day: Date
    var hours: Int
}

public var ProfileData : [ProfileModel] = [
    ProfileModel(day:  Calendar.current.date(from: .init(year: 2023,month: 12, day:18)) ?? Date(), hours: 2),
    ProfileModel(day:  Calendar.current.date(from: .init(year: 2023,month: 12, day:19)) ?? Date(), hours: 3),
    ProfileModel(day:  Calendar.current.date(from: .init(year: 2023,month: 12, day:20)) ?? Date(), hours: 4),
    ProfileModel(day:  Calendar.current.date(from: .init(year: 2023,month: 12, day:21)) ?? Date(), hours: 5),
    ProfileModel(day:  Calendar.current.date(from: .init(year: 2023,month: 12, day:22)) ?? Date(), hours: 6),
    ProfileModel(day:  Calendar.current.date(from: .init(year: 2023,month: 12, day:23)) ?? Date(), hours: 2),
    ProfileModel(day:  Calendar.current.date(from: .init(year: 2023,month: 12, day:24)) ?? Date(), hours: 9)
]
   

