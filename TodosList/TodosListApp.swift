//
//  TodosListApp.swift
//  TodosList
//
//  Created by 神山賢太郎 on 2021/10/16.
//

import SwiftUI

@main
struct TodosListApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
