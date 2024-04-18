//
//  Persistance.swift
//  Cenima
//
//  Created by RMP on 22/09/1445 AH.
//

import Foundation
import CoreData


struct PersistanceController {
    
    static let main = PersistanceController()
    
    let container: NSPersistentContainer
    
    init() {
        
        container = NSPersistentContainer(name: "ReservationModel")
        
        container.loadPersistentStores { description, error in
            
            if error != nil {
                
                fatalError(error!.localizedDescription)
                
            }
            
        }
        
    }
    
}
