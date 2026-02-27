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
                    ForEach($tasks) { $task in
                        NavigationLink {
                            TaskDetailView(task: $task)
                        } label: {
                            TaskRow(task: task)
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .onAppear {
                tasks = TaskStore.load()
            }
            .onChange(of: tasks) { _, newValue in
                TaskStore.save(newValue)
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
    
    private func addTask() {
        let newTask = Task.newDefaultTask(number: tasks.count + 1)
        
        withAnimation {
            tasks.append(newTask)
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

