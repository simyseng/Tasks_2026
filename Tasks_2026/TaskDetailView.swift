//
//  TaskDetailView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var task: Task

    private let categories = ["School", "Personal", "CCA"]

    var body: some View {
        Form {
            Section("Task") {
                TextField("Title", text: $task.title)
                    .textInputAutocapitalization(.sentences)
                
                Picker("Category", selection: $task.category) {
                    ForEach(categories, id: \.self) { c in
                        Text(c).tag(c)
                    }
                }
                
                DatePicker("Due Date", selection: $task.dueDate, displayedComponents: .date)
            }
            
            Section("Status") {
                Toggle("Completed", isOn: $task.isCompleted)
            }
        }
    }
}
