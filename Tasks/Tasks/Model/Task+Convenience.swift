//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Chris Price on 4/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String, CaseIterable {
    case low
    case normal
    case high
    case critical
}

// We need a way to initialize a Task object given its properties
extension Task {
    @discardableResult convenience init(identifier: UUID = UUID(),
                     name: String,
                     notes: String?,
                     complete: Bool = false,
                     priority: TaskPriority,
                     context: NSManagedObjectContext) {
        
        // Set up the NSManagedObject portion of the Task object
        self.init(context: context)
        
        // Assign out unique values to the attributes we creatied in the data model file.
        self.identifier = identifier
        self.name = name
        self.notes = notes
        self.complete = complete
        self.priority = priority.rawValue
    }
}
