//
//  Task.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var category: String
    var dueDate: Date
    var isCompleted: Bool
    
    static func newDefaultTask(number: Int) -> Task {
        Task(
            title: "New Task \(number)",
            category: "Personal",
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: .now) ?? .now,
            isCompleted: false
        )
    }
}
