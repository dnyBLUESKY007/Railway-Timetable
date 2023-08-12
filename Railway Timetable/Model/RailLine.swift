//
//  RailLine.swift
//  Railway Timetable
//
//  Created by BLUESKY007 on 2023-08-12.
//

import Foundation
import SwiftUI

struct RailLine: Hashable, Codable, Identifiable {
    var id: Int
    var city: String
    var name: String
    var color: String
    var isNumber: Bool
    var isLoop: Bool
    var stops: [String]
}
