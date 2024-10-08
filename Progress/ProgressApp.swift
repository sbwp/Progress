//
//  ProgressApp.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import SwiftUI
import SwiftData

@main
struct ProgressApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Project.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
