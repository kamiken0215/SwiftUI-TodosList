//
//  ContentView.swift
//  TodosList
//
//  Created by 神山賢太郎 on 2021/10/16.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)])
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    Text(task.title ?? "Untitled")
                        .onTapGesture {
                            updateTask(task)
                        }
                }.onDelete(perform: deleteTasks)
            }
            .navigationTitle("Todo List")
            .navigationBarItems( trailing: Button("Add Task") {
                addTask()
            })
        }
    }
    
    private func updateTask(_ task: FetchedResults<Task>.Element) {
        withAnimation {
            task.title = "UPDATE"
        }
    }
    
    private func deleteTasks(offsets: IndexSet) {
        
        withAnimation {
            offsets.map({ tasks[$0] }).forEach(viewContext.delete)
            saveContext()
        }
        
    }
    
    //  端末の容量が少ない時のエラーをキャッチ
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresoleved Error: \(error)")
        }
    }
    
    private func addTask() {
        
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.title = "New Task \(Date())"
            newTask.date = Date()
            
            saveContext()
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
