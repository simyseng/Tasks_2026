//
//  ContentView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var taskTitles: [String] = [
        "Finish Maths Homework",
        "Pack PE Attire",
        "Practise Piano"
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(taskTitles, id: \.self) { title in
                    Text(title)
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    ContentView()
}
