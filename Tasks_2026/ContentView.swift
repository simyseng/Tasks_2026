//
//  ContentView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var tasks: [Task] = []
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                Section("My Tasks") {
                    ForEach(tasks) { task in
                        NavigationLink {
                            TaskDetailView(task: task)
                        } label: {
                            TaskRow(task: task)
                        }
                    }
                  //  .onDelete(perform: deleteTasks)
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
            modelContext.insert(newTask)
        }
    }
/*
    private func deleteTasks(at offsets: IndexSet) {
        modelContext.remove(atOffsets: offsets)
    }
}
*/
#Preview {
    ContentView()
}

