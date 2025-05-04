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
            Color("LightPurple")
                .ignoresSafeArea()
            
            VStack{
                
                //to do text and add button
                HStack{
                    Text("To-Do List")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("DeepPurple"))
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
                            .foregroundColor(Color("DeepPurple"))
                    }
                }
                .padding()
                
                VStack {
                    List {
                        ForEach(toDos) { toDoItem in
                            VStack {
                                if toDoItem.isImportant == true {
                                    Text("‼️" + " " +  toDoItem.title)
                                } else {
                                    Text(toDoItem.title)
                                }
                            }
                            .foregroundStyle(Color("DeepPurple"))
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color("LighterPurple"))
                            .cornerRadius(15)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        }
                        .onDelete(perform: deleteToDo)
                    }
                    .listStyle(.plain)
                }
                
                
            }
            
            .safeAreaInset(edge: .bottom) {
                
                    if showNewTask {
                        NewToDoView(showNewTask: $showNewTask, ToDoItem: toDoItem(title: "", isImportant: false))
    
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
        .modelContainer(for: toDoItem.self)
}
