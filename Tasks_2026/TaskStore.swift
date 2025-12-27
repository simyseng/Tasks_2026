//
//  TaskStore.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 27/12/25.
//

import Foundation

struct TaskStore {
    private static let key = "saved_tasks_v1"

    static func save(_ tasks: [Task]) {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Failed to save tasks:", error)
        }
    }

    static func load() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }

        do {
            return try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Failed to load tasks:", error)
            return []
        }
    }
}
