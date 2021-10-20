//
//  Persistence.swift
//  TodosList
//
//  Created by 神山賢太郎 on 2021/10/16.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodosList")
        
        container.loadPersistentStores { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unreslved error: \(error)")
            }
            
        }
    }
    
}
