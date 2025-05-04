////
////  EditToDoItem.swift
////  NicoleBondToDoList
////
////  Created by Scholar on 5/4/25.
////
//
//import SwiftUI
//
//struct EditToDoView: View {
//    @Binding var task: toDoItem
//    var onSave: () -> Void
//
//    var body: some View {
//        VStack(spacing: 20) {
//            TextField("Task Title", text: $task.title)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Toggle("Important", isOn: $task.isImportant)
//
//            Button("Save") {
//                onSave()
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(8)
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
//    }
//}
//
//#Preview {
//    EditToDoItem()
//}
