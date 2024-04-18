//
//  CenimaApp.swift
//  Cenima
//
//  Created by RMP on 16/09/1445 AH.
//

import SwiftUI

@main
struct CenimaApp: App {
    
    
    @AppStorage("Access") var userAccess: Bool = false
    
    let persistanceController = PersistanceController.main
    
    var body: some Scene {
        
        WindowGroup {
            
            if userAccess == false {
                
                MainView().environment(\.managedObjectContext, persistanceController.container.viewContext)
                
            } else {
                
                MainTabView().environment(\.managedObjectContext, persistanceController.container.viewContext)
                
            }
            
        }
    }
}
