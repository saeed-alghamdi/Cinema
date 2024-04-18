//
//  LoginView.swift
//  Cenima
//
//  Created by RMP on 16/09/1445 AH.
//

import SwiftUI

struct LoginView: View {
    
    /*
     
     
     
     🔵🔵🔵 CREATE APPSTORAGE FOR SAVE LOGIN AND SINGUP
            WITHOUT ANY CREDNTIALS CHECK JUST FAKE IT 🔵🔵🔵
     
     
     */
    
    @AppStorage("Access") var userAccess: Bool?
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var email = "example@example.com"
    @State var password = "pa$$word"
    
    @State var showingMainTabView = false
    
    @State var showingSignUpView: Bool = false
    
    var body: some View {
        
        GeometryReader { axis in
            
            let viewHeight = axis.frame(in: .global).height
            let viewWidth = axis.frame(in: .global).width
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Image("SMH3").resizable().frame(width: viewWidth / 2 + 140, height: viewHeight / 2, alignment: .center)
                    
                    VStack(spacing: -20) {
                        
                        TextField("Email", text: $email).multilineTextAlignment(.leading).font(.headline).padding().padding().overlay() {
                            
                            RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray).padding()
                            
                        }
                        
                        SecureField("Password", text: $password).multilineTextAlignment(.leading).font(.headline).padding().padding().overlay() {
                            
                            RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray).padding()
                            
                            
                        }
                        
                    }
                    
                    VStack {
                        
                        Button {
                            
                            showingMainTabView = true
                            userAccess = true
                            
                        } label: {
                            
                            RoundedRectangle(cornerRadius: 10.0).foregroundColor(.yellow).overlay {
                                Text("Log In").font(.headline).fontWeight(.bold).foregroundColor(.primary)
                            }.frame(height: UIScreen.main.bounds.maxX - UIScreen.main.bounds.midX - UIScreen.main.bounds.minX - 130, alignment: .center)
                            
                        }.fullScreenCover(isPresented: $showingMainTabView) {
                            
                            MainTabView()
                            
                        }
                        
                        
                        

                        
                        Button(action: {}) {
                            Text("Forget Your password?").foregroundColor(.accentColor)
                                
                        }.padding([.top, .bottom], 10)
                        
                        HStack() {
                            
                            Text("Don't have an account?").foregroundColor(.gray).fontWeight(.semibold)
                                
                            Button {
                                
                                showingSignUpView = true
                                
                            } label: {
                                
                                Text("Sign up").font(.headline).fontWeight(.bold)
                                    .foregroundColor(.yellow)
                                
                            }.fullScreenCover(isPresented: $showingSignUpView) {
                                
                                SignUpView()
                                
                            }
                        
                            
                        }
                        
                    }.padding()
                    
                }
                
            }
            
            
        }.toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "chevron.left").foregroundColor(.yellow)
                    
                }

            }
            
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
