//
//  TaskDetailView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct TaskDetailView: View {
    let task: Task

    var body: some View {
        VStack(spacing: 12) {
            Text(task.title)
                .font(.title2)
                .fontWeight(.bold)

            Text("Category: \(task.category)")
                .foregroundStyle(.secondary)

            Spacer()
            Text("Due: \(task.dueDate.formatted(date: .long, time: .omitted))")
            Text(task.isCompleted ? "✅ Completed" : "⭕ Not completed")
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
