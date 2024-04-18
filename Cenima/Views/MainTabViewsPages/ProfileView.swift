//
//  ProfileView.swift
//  Cenima
//
//  Created by RMP on 06/10/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    
    
    @AppStorage("Access") var userAccess: Bool?
    
    @State var showingMainView: Bool = false
    
    @State var showingListInformation: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    Image("dog").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height / 3, alignment: .center).clipShape(Circle()).shadow(color: .primary, radius: 15, x: -2, y: 0)
                    
                    
                    Button {
                        
                        showingListInformation = true
                        
                        
                    } label: {
                        
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor).shadow(radius: 9).frame(height: 50).overlay {
                            
                            Text("example@example").foregroundColor(.white).font(.title3).bold()
                            
                        }
                        
                    }.fullScreenCover(isPresented: $showingListInformation, content: {
                        InformationView()
                    }).padding(.top, 20)
                    
                    
                    Button {
                        
                        showingMainView = true
                        userAccess = false
                        
                    } label: {
                        
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.red).shadow(radius: 9).frame(height: 50).overlay {
                            
                            Text("Log Out").foregroundColor(.white).font(.title3).bold()
                            
                        }
                        
                    }.fullScreenCover(isPresented: $showingMainView, content: {
                        
                        MainView()
                        
                    }).padding(.top, 10)

                }.padding(.top, 15).padding()
                
            }.navigationTitle("Profile").navigationBarTitleDisplayMode(.large)
            
        }
        
        
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
