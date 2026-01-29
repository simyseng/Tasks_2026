//
//  TaskDetailView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var task: Task
    let categories = ["School", "Personal"]

    var body: some View {
        Form {
            Section("Task Info"){
                TextField("Title:", text: $task.title)
                Picker("Category", selection: $task.category) {
                    ForEach(categories, id:\.self) { c in
                        Text(c).tag(c)
                    }
                }
            }
            Section("Status") {
                DatePicker("Due", selection: $task.dueDate, displayedComponents: .date)
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
