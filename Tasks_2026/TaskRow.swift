//
//  TaskRow.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task: Task

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title3)
                .foregroundStyle(task.isCompleted ? .green : .gray)
                .onTapGesture {
                    task.isCompleted.toggle()
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted)
                    .foregroundStyle(task.isCompleted ? .gray : .primary)
                Text("\(task.category) • Due \(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(12)
        .opacity(task.isCompleted ? 0.5 : 1.0)
    }
}

#Preview {
    TaskRow(task: .constant(Task(title: "Maths Homework", category: "School", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: .now) ?? .now, isCompleted: false)))
}
