//
//  ContentView.swift
//  to do list app
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItem: FetchedResults<ToDo>
    @State private var showNewTask = false
    
    var body: some View {
        
        VStack {
            HStack{
                Text("DO IT! to dos")
                    .font(.title)
                    .padding()
                Button(action: {
                    self.showNewTask = true
                }){
                    Text("+")
            }
                
            }
            Spacer()
            List {
                ForEach (toDoItems) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("!!" + (toDoItem.title ?? "No title"))
                    } else{ Text(toDoItem.title ?? "No title")
                    }
                    
                }
            }
            .listStyle(.plain)
        }
  
        
        if showNewTask {
                NewToDoView(showNewTask: $showNewTask, title: "", isImportant: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
