//
//  ContentView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    
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
                // ✅ iOS built-in "Edit" button (turns on delete/reorder UI)
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }

                // ✅ "+" button to add a new row
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addTask()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                tasks = TaskStore.load()
            }
            .onChange(of: tasks) { _, newValue in
                TaskStore.save(newValue)
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

