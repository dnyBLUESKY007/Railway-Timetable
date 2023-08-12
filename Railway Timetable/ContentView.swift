//
//  ContentView.swift
//  Railway Timetable
//
//  Created by BLUESKY007 on 2023-07-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LineList()
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
