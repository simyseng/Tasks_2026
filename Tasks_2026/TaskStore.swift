//
//  TaskStore.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 27/12/25.
//

import Foundation

struct TaskStore {
    private static let key = "saved_tasks"

    static func save(_ tasks: [Task]) {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    static func load() -> [Task] {
        if let data = UserDefaults.standard.data(forKey: key),
           let tasks = try? JSONDecoder().decode([Task].self, from: data) {
            return tasks
        }
        return []
    }
}
