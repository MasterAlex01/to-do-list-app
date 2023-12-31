//
//  ContentView.swift
//  to do list app
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    @State var count = 0
    @State private var showNewTask = false
    
    var body: some View {
        ZStack{
            Color(red:0.95, green: 0.95, blue: 0.95)
                .ignoresSafeArea()
            VStack {
                HStack{
                    Image("doItList")
                        .padding()
                    Button(action: {
                        self.showNewTask = true
                    }){
                        Text("+")
                            .font(.title)
                    }
                
                }
                Spacer()
                
                Text("You have \(count) things to do!")
                List {
                    ForEach(toDoItems) {
                        toDoItem in
                        if toDoItem.isImportant == true {
                            Text("❗️❗️" + (toDoItem.title ?? "No title"))
                        } else {
                            Text(toDoItem.title ?? "No title")
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(.plain)
                
            }
        }
        
        
        if showNewTask {
            newToDo(title: "", isImportant: false, count: $count, showNewTask: $showNewTask)
        }
    }
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { toDoItems[$0] }.forEach(context.delete)
            do {
                try context.save()
                count = count - 1
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
