//
//  LineIcon.swift
//  Railway Timetable
//
//  Created by BLUESKY007 on 2023-08-13.
//

import SwiftUI

struct LineIcon: View {
    var name: String
    var color: Color
    var isNumber: Bool
    
    var body: some View {
        let spaceIndex = name.firstIndex(of: " ") ?? name.endIndex
        let textString: String = String("\(isNumber ? name : String(name[..<spaceIndex]))")
        let textStringAfter: String = String("\(isNumber ? name : String(name[spaceIndex..<name.endIndex]))")
        var frameWidth: CGFloat {
            switch textString.count {
            case 1:
                return 20
            case 2:
                return 40
            case 3:
                return 75
            default:
                return 0
            }
        }
        var fontSize: CGFloat {
            switch textString.count {
            case 1:
                return 30
            case 2:
                return 30
            case 3:
                return 24
            default:
                return 0
            }
        }
        var topPaddingWidth: CGFloat {
            switch textString.count {
            case 1:
                return 6
            case 2:
                return 4
            case 3:
                return 0
            default:
                return 0
            }
        }
        if isNumber {
            HStack {
                ZStack(alignment: .bottom) {
                    color
                    Text(textString)
                        .font(.system(size: fontSize, design: .default))
                        .fontWeight(.bold)
                        .scaledToFill()
                        .padding([.top], topPaddingWidth)
                        .frame(maxWidth: frameWidth, maxHeight: 40)
                }
                .frame(width: frameWidth, height: 40)
                .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("号线")
                        .font(.title3)
                        .bold()
                        .scaledToFill()
                        .frame(width: 40)
                    Text("Line \(name)")
                        .font(.caption2)
                        .bold()
                        .scaledToFill()
                        .frame(width: 40)
                }
                .frame(width: 35)
                .scaledToFill()
            }
            .frame(minWidth: 100)
        } else {
            VStack {
                ZStack(alignment: .bottom) {
                    color
                    Text(textString)
                        .font(.system(size: fontSize, design: .default))
                        .fontWeight(.bold)
                        .scaledToFill()
                        .padding([.top], topPaddingWidth)
                        .frame(maxWidth: frameWidth, maxHeight: 40)
                }
                .frame(width: frameWidth, height: 30)
                .foregroundColor(.white)
                Text(textStringAfter)
                    .font(.system(size: 8))
                    .bold()
                    .scaledToFill()
                    .frame(width: 60)
            }
            .frame(minWidth: 100)
        }
    }
}

struct LineIcon_Previews: PreviewProvider {
    var lines: [RailLine] = ModelData().lines
    static var previews: some View {
        LineIcon(name: "1", color: Color(hex: "#d20200"), isNumber: true)
        LineIcon(name: "城郊线 CHENGJIAO Line", color: Color(hex: "#a3ae75"), isNumber: false)
        LineIcon(name: "12", color: Color(hex: "#175fa3"), isNumber: true)
    }
}
