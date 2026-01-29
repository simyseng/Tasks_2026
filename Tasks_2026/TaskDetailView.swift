//
//  TaskDetailView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var task: Task

    var body: some View {
        Form {
            Section("Task Info"){
                TextField("Title:", text: $task.title)
                TextField("Category", text: $task.category)
            }
            Section("Status") {
                DatePicker("Due", selection: $task.dueDate)
                    .displayedComponents(.date)
                Toggle("Due Date", isOn: $task.isCompleted)
            }
            
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TaskDetailView(task: .constant(Task(
        title: "HW 1",
        category: "School",
        dueDate: Date(),
        isCompleted: false
    )))
}
