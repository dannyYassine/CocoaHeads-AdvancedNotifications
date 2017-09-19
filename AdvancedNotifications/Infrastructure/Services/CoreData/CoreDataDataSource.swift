//
//  CoreDataDataSource.swift
//  AdvancedNotifications
//
//  Created by Danny Yassine on 2017-09-17.
//  Copyright © 2017 Danny Yassine. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataService {
    func execute(fetchRequest request: NSFetchRequest<NSFetchRequestResult>, completion: @escaping (_ result: Result<[NSFetchRequestResult]>) -> Void)
}
