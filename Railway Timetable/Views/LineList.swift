//
//  LineList.swift
//  Railway Timetable
//
//  Created by BLUESKY007 on 2023-08-13.
//

import SwiftUI

struct LineList: View {
    @EnvironmentObject var modelData: ModelData
    var lines: [RailLine] {
        modelData.lines
    }
    
    var body: some View {
        List {
            ForEach(lines) { line in
                LineRow(line: line)
            }
        }
        .navigationTitle("Lines")
        .toolbar {
            ToolbarItem {
                Menu {
                    
                } label: {
                    Label("Filter", systemImage: "slider.horizontal.3")
                }
            }
        }
    }
}

struct LineList_Previews: PreviewProvider {
    static var previews: some View {
        LineList()
            .environmentObject(ModelData())
    }
}
