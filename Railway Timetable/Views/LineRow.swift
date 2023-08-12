//
//  LineRow.swift
//  Railway Timetable
//
//  Created by BLUESKY007 on 2023-08-12.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct LineRow: View {
    var line: RailLine
    
    var body: some View {
        let spaceIndex = line.name.firstIndex(of: " ") ?? line.name.startIndex
        let textString: String = String("\(line.isNumber ? line.name : String(line.name[spaceIndex..<line.name.endIndex]))")
        VStack {
            HStack {
                LineIcon(name: line.name, color: Color(hex: line.color), isNumber: line.isNumber)
                VStack(alignment: .leading) {
                    Text("\(line.isNumber ? "号线 Line "+line.name : textString)")
                        .bold()
                    Text("description")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct LineRow_Previews: PreviewProvider {
    static var lines = ModelData().lines
    
    static var previews: some View {
        LineRow(line: lines[0])
        LineRow(line: lines[1])
        LineRow(line: lines[2])
        LineRow(line: lines[3])
        LineRow(line: lines[4])
        LineRow(line: lines[8])
        LineRow(line: lines[9])
        LineRow(line: lines[10])
        LineRow(line: lines[lines.count - 1])
    }
}
