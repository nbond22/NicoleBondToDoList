//
//  NewToDoView.swift
//  NicoleBondToDoList
//
//  Created by Scholar on 4/28/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Binding var showNewTask: Bool
    @Bindable var toDoItem: toDoItem
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        VStack {
            Text("What do you need to do?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("DeepPurple")).multilineTextAlignment(.center)
            
            TextField("Enter the task description here...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(20)
            
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
                    .fontWeight(.semibold)
                    .italic()
                    .foregroundColor(Color("DeepPurple"))
            }
            
            Button {
                addToDo()
                self.showNewTask = false
            } label: {
                Text("Save")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("DeepPurple"))
            }
        }
        .padding(20)
        .background(Color("LighterPurple"))
        
        Spacer()
    }
    
    func addToDo () {
        let toDo = NicoleBondToDoList.toDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: toDoItem.self, configurations: config)

    let toDo = toDoItem(title: "", isImportant: false)
    return NewToDoView(showNewTask: .constant(true), toDoItem: toDo)
        .modelContainer(container)
}
