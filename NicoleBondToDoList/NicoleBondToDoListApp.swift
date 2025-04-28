//
//  NicoleBondToDoListApp.swift
//  NicoleBondToDoList
//
//  Created by Scholar on 4/28/25.
//

import SwiftUI
import SwiftData

@main
struct NicoleBondToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: toDoItem.self)
        }
    }
}
