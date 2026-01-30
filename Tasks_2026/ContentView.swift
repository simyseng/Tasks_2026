//
//  ContentView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(title: "Finish Maths Homework", category: "School",
                 dueDate: Calendar.current.date(byAdding: .day, value: 1, to: .now) ?? .now,
                 isCompleted: false),
            Task(title: "Pack PE Attire", category: "Personal",
                 dueDate: Calendar.current.date(byAdding: .day, value: 2, to: .now) ?? .now,
                 isCompleted: true),
            Task(title: "Practise Piano", category: "CCA",
                 dueDate: Calendar.current.date(byAdding: .day, value: 3, to: .now) ?? .now,
                 isCompleted: false)
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { $task in
                    let t = $task.wrappedValue
                    NavigationLink {
                        TaskDetailView(task: $task)
                    } label: {
                        HStack {
                            Text(t.isCompleted ? "✅" : "⭕")
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(t.title).font(.headline)
                            Text("\(t.category) • Due \(t.dueDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
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
