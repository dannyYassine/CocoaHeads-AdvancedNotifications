//
//  CoreDataStore.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore {
    static let shared = CoreDataStore()
    var managedObjectContext: NSManagedObjectContext?
    var persistantStore: NSPersistentStore?
    var managedObjectModel: NSManagedObjectModel?
}

extension CoreDataStore: CoreDataService {
    func execute(fetchRequest request: NSFetchRequest<NSFetchRequestResult>, completion: @escaping (Result<[NSFetchRequestResult]>) -> Void) {
        
    }
}
