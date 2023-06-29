//
//  newToDo.swift
//  to do list app
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct newToDo: View {
    @Environment(\.managedObjectContext) var context
    @State var title: String
    @State var isImportant: Bool
    @Binding var showNewTask: Bool
    
    var body: some View {
        VStack{
            Text("Task Ttile")
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            TextField("Eneter the task description here...", text: $title)
                .multilineTextAlignment(.center)
                //the alignement is responsible for the text
                
            Toggle(isOn: $isImportant) {
                Text("Is this important?")
                    .padding()
            }
            Button("Add"){
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }
        }
    }
    
    private func addTask(title: String, isImportant: Bool = false) {
            
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
        }
}

struct newToDo_Previews: PreviewProvider {
    static var previews: some View {
        newToDo(title: "", isImportant: false, showNewTask: .constant(true))
    
    }
}
