//
//  MainTabView.swift
//  Cenima
//
//  Created by RMP on 17/09/1445 AH.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        VStack {
            
            TabView {
                
                MoviesView().tabItem {
                    Label("Movies", systemImage: "camera.aperture")
                }
                
                SearchMoviesView().tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle.fill")
                }
                
                ReservationsView().tabItem {
                    Label("Reservations", systemImage: "wallet.pass.fill")
                }
                
                ProfileView().tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
                
            }
            
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
