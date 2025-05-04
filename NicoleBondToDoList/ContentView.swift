//
//  ContentView.swift
//  NicoleBondToDoList
//
//  Created by Scholar on 4/28/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    
    @Query var toDos: [toDoItem]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            Color(.systemRed)
                .ignoresSafeArea()
            
            VStack{
                
                //to do text and add button
                HStack{
                    Text("To-Do List")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    Button {
                        withAnimation {
                            self.showNewTask = true
                        }
                    } label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.orange)
                    }
                }
                .padding()
                
                VStack {
                    List {
                        ForEach(toDos) { toDoItem in
                            if toDoItem.isImportant == true {
                                Text("‼️" + toDoItem.title)
                            } else {
                                Text(toDoItem.title)
                            }
                            
                        }
                        .onDelete(perform: deleteToDo)
                        
                    }
                    .listStyle(.plain)
                }
                
                
            }
            
            .safeAreaInset(edge: .bottom) {
                
                    if showNewTask {
                        NewToDoView(showNewTask: $showNewTask, toDoItem: toDoItem(title: "", isImportant: false))
    
                }
            }
        }
    }
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
