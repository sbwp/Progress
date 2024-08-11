//
//  ContentView.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var projects: [Project]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(projects) { project in
                    NavigationLink {
                        ProjectView(project: project)
                    } label: {
                        VStack {
                            HStack {
                                Text(project.title)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            ProgressView(value: project.currentProgress, total: project.length)
                                .tinted(project.color.color)
                        }
                        .padding(.vertical)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a project")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Project(title: "New Project", start: Date().startOfDay, end: Date().addDays(7).startOfDay)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(projects[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Project.self, inMemory: true)
}
