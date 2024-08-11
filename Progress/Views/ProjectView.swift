//
//  ProjectView.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import SwiftUI

struct ProjectView: View {
    @Environment(\.editMode) var editModeWrapper
    @Bindable var project: Project
    
    var editMode: EditMode {
        editModeWrapper?.wrappedValue ?? .inactive
    }
    
    var includeDate: Bool {
        return !project.includeTime || !(project.start.isToday && project.end.isToday)
    }
    
    var displayedComponents: DatePicker.Components {
        return project.includeTime ? [.date, .hourAndMinute] : [.date]
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                if (editMode == .active) {
                    TextField("Title", text: $project.title)
                        .onAppear() {
                            UITextField.appearance().clearButtonMode = .whileEditing
                        }
                } else {
                    Text(project.title)
                    Spacer()
                }
            }
            .font(.title)
            .fontWeight(.bold)
            
            ProgressView(value: project.currentProgress, total: project.length)
                .progressViewStyle(ThickBarProgressViewStyle())
                .tinted(project.color.color)
            
            if (editMode == .active) {
                ColorPickerView("Color", color: $project.color)
                DatePicker("Start Date", selection: $project.start, displayedComponents: displayedComponents)
                DatePicker("End Date", selection: $project.end, displayedComponents: displayedComponents)
                Toggle("Include Time", isOn: $project.includeTime)
            } else {
                HStack {
                    Text(project.start.format(includeDate: includeDate, includeTime: project.includeTime))
                    Spacer()
                    Text(project.end.format(includeDate: includeDate, includeTime: project.includeTime))
                }
                .font(.caption2)
            }
            
            HStack {
                Toggle("Completed", isOn: $project.completed)
                    .frame(maxWidth: 150)
                Spacer()
            }
            
            Spacer()
        }
        .navigationTitle(editMode == .active ? "Edit Project" : "View Project")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            EditButton()
        }
        .padding()
        .onChange(of: editMode) { oldValue, _ in
            if oldValue == .active && !project.includeTime {
                project.start = project.start.startOfDay
                project.end = project.end.startOfDay
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProjectView(project: Project())
    }
}
