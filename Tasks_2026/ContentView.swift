//
//  ContentView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(title: "Finish Maths Homework", category: "School"),
        Task(title: "Pack PE Attire", category: "Personal"),
        Task(title: "Practise Piano", category: "CCA")
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.title).font(.headline)
                        Text(task.category).font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    ContentView()
}
