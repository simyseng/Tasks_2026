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
        VStack(alignment: .leading, spacing: 12) {
            Text(task.title)
                .font(.title2)
                .fontWeight(.bold)

            Text("Category: \(task.category)")
                .foregroundStyle(.secondary)

            Text("Due: \(task.dueDate.formatted(date: .long, time: .omitted))")
<<<<<<< Updated upstream
            Text(task.isCompleted ? "✅ Completed" : "⭕ Not completed")
=======
                .foregroundStyle(.secondary)

            Toggle("Completed", isOn: $task.isCompleted)
                .padding(.top, 10)

            Spacer()
>>>>>>> Stashed changes
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
