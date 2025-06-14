//
//  EditItemTryout.swift
//  ToDoList
//
//  Created by Sneha Debnath on 15/10/24.
//

//import SwiftUI
//
//struct EditItemTryout: View {
//    @EnvironmentObject var listViewModel: ListViewModel
//    
//    @State private var isEditing = false
//    @State private var editedTitle = ""
//    //@State private var editedDescription = ""
//    @State private var selectedTodo: ItemModel?
//    
//    
//    var body: some View {
//        NavigationView {
//                    List {
//                        ForEach(ItemModel.indices, id: \.self) { index in
//                            Text(ItemModel[index].title)
//                                .onTapGesture {
//                                    selectedTodo = ItemModel[index]
//                                    editedTitle = selectedTodo?.title ?? ""
//                                    isEditing = true
//                                }
//                        }
//                    }
//                    .navigationTitle("Edit Item")
//                    .sheet(isPresented: $isEditing) {
//                        if let todo = selectedTodo {
//                            EditTodoView(todo: $items[ItemModel.firstIndex(where: { $0.id == todo.id })!], isEditing: $isEditing)
//                        }
//                    }
//                }
//    }
//}
//
//struct EditTodoView: View {
//    @Binding var todo: ItemModel
//    @Binding var isEditing: Bool
//    @State private var editedTitle = ""
//    
//    var body: some View {
//        VStack {
//            TextField("Edit To-Do", text: $todo.title)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            Button("Save") {
//                isEditing = false
//            }
//            .padding()
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    EditItemTryout()
//}

//import SwiftUI
//
//struct TodoItem: Identifiable {
//    let id = UUID()
//    var title: String
//}
//
//struct ContentView: View {
//    @State private var todoList = [
//        TodoItem(title: "Buy groceries"),
//        TodoItem(title: "Go for a run"),
//        TodoItem(title: "Read a book")
//    ]
//    
//    @State private var isEditing = false
//    @State private var editedTitle = ""
//    @State private var selectedTodo: TodoItem?
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(todoList.indices, id: \.self) { index in
//                    Text(todoList[index].title)
//                        .onTapGesture {
//                            selectedTodo = todoList[index]
//                            editedTitle = selectedTodo?.title ?? ""
//                            isEditing = true
//                        }
//                }
//            }
//            .navigationTitle("To-Do List")
//            .sheet(isPresented: $isEditing) {
//                if let todo = selectedTodo {
//                    EditTodoView(todo: $todoList[todoList.firstIndex(where: { $0.id == todo.id })!], isEditing: $isEditing)
//                }
//            }
//        }
//    }
//}
//
//struct EditTodoView: View {
//    @Binding var todo: TodoItem
//    @Binding var isEditing: Bool
//    @State private var editedTitle = ""
//    
//    var body: some View {
//        VStack {
//            TextField("Edit To-Do", text: $todo.title)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            Button("Save") {
//                isEditing = false
//            }
//            .padding()
//        }
//        .padding()
//    }
//}

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
}

struct ContentView: View {
    @State private var todoList = [
        TodoItem(title: "Buy groceries"),
        TodoItem(title: "Go for a run"),
        TodoItem(title: "Read a book")
    ]
    
    @State private var isEditing = false
    @State private var selectedTodo: TodoItem?

    var body: some View {
        NavigationView {
            List {
                ForEach(todoList.indices, id: \.self) { index in
                    Text(todoList[index].title)
                        .onTapGesture {
                            selectedTodo = todoList[index]
                            isEditing = true
                        }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("To-Do List")
            .sheet(isPresented: $isEditing) {
                if let todo = selectedTodo,
                   let todoIndex = todoList.firstIndex(where: { $0.id == todo.id }) {
                    EditTodoView(todo: $todoList[todoIndex], isEditing: $isEditing)
                        .onAppear {
                            // Ensure that the selected todo is assigned to the binding properly
                        }
                }
            }
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
    }
}

struct EditTodoView: View {
    @Binding var todo: TodoItem
    @Binding var isEditing: Bool

    var body: some View {
        VStack {
            TextField("Edit To-Do", text: $todo.title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save") {
                isEditing = false
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
