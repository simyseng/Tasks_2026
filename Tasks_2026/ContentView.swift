//
//  ContentView.swift
//  Tasks_2026
//
//  Created by Stanley Sim on 26/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var selectedFilter: TaskFilter = .all
    
    enum TaskFilter: String, CaseIterable {
        case all = "All"
        case school = "School"
        case personal = "Personal"
        case cca = "CCA"
    }
    
    var filteredTasks: [Task] {
        if selectedFilter == .all {
            return tasks
        }
        return tasks.filter { $0.category == selectedFilter.rawValue }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background
                LinearGradient(
                    colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Custom header with stats
                    TaskStatsHeader(tasks: tasks)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    // Filter pills
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(TaskFilter.allCases, id: \.self) { filter in
                                FilterPill(
                                    title: filter.rawValue,
                                    isSelected: selectedFilter == filter,
                                    count: filter == .all ? tasks.count : tasks.filter { $0.category == filter.rawValue }.count
                                ) {
                                    withAnimation(.spring(response: 0.3)) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                    }
                    
                    // Task list
                    if filteredTasks.isEmpty {
                        EmptyStateView()
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(tasks.indices, id: \.self) { index in
                                    if selectedFilter == .all || tasks[index].category == selectedFilter.rawValue {
                                        NavigationLink {
                                            TaskDetailView(task: $tasks[index])
                                        } label: {
                                            ModernTaskRow(task: tasks[index])
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .contextMenu {
                                            Button(role: .destructive) {
                                                withAnimation {
                                                    tasks.remove(at: index)
                                                }
                                            } label: {
                                                Label("Delete", systemImage: "trash")
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Tasks")
                        .font(.title2.bold())
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addTask()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .onAppear {
                tasks = TaskStore.load()
            }
            .onChange(of: tasks) { _, newValue in
                TaskStore.save(newValue)
            }
        }
    }
    
    private func addTask() {
        let newTask = Task.newDefaultTask(number: tasks.count + 1)
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            tasks.insert(newTask, at: 0)
        }
    }
}



#Preview {
    ContentView()
}

