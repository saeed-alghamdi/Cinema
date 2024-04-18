//
//  ContentView.swift
//  Cenima
//
//  Created by RMP on 16/09/1445 AH.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
    
        NavigationView {
            
            GeometryReader { axis in
                let viewHeight = axis.frame(in: .global).height
                let viewWidth = axis.frame(in: .global).width
                
                VStack {
                    
                    Image("SMH3").resizable().frame(width: viewWidth / 1.2, height: viewHeight / 1.8, alignment: .center).padding(.top, -50)
                    
                    VStack {
                        
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                            
                            
                            RoundedRectangle(cornerRadius: 10.0).foregroundColor(.yellow).overlay {
                                Text("Log In").font(.headline).fontWeight(.bold).foregroundColor(.black)
                            }.frame(height: 60, alignment: .center)
                            
                        }
                        
                        
                        NavigationLink {
                            SignUpView().navigationBarBackButtonHidden(true)
                        } label: {
                            RoundedRectangle(cornerRadius: 10.0).foregroundColor(.yellow).overlay {
                                Text("Sign Up").font(.headline).fontWeight(.bold).foregroundColor(.black)
                            }.frame(height: 60, alignment: .center)
                        }

                        
                    }.padding()
                    
                }
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
