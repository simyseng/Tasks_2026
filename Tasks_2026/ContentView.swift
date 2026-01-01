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
                Section("My Tasks") {
                    ForEach(tasks.indices, id: \.self) { index in
                        NavigationLink {
                            TaskDetailView(task: $tasks[index])
                        } label: {
                            TaskRow(task: tasks[index])
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addTask()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    // MARK: - Actions

    private func addTask() {
        let newTask = Task.newDefaultTask(number: tasks.count + 1)
        
        withAnimation {
            tasks.append(newTask)
        }
    }

    private func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

