//
//  SignUpView.swift
//  Cenima
//
//  Created by RMP on 16/09/1445 AH.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @AppStorage("Access") var userAccess: Bool?
    
    @State var emailTextField = "example@example.com"
    @State var passwordTextField = "pa$$word"
    @State var confirmPasswordTextField = "pa$$word"
    
    @State var showingMainTabView = false
    
    var body: some View {
        
        GeometryReader { axis in
            
            let viewHeight = axis.frame(in: .global).height
            let viewWidth = axis.frame(in: .global).width
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Image("SMH3").resizable().aspectRatio(contentMode: .fill).frame(width: viewWidth, height: viewHeight / 2, alignment: .center)
                
                VStack {
                    
                    VStack(spacing: -15) {
                        
                        TextField("Email", text: $emailTextField).multilineTextAlignment(.leading).font(.headline).padding().padding().autocorrectionDisabled(true).textContentType(.emailAddress).submitLabel(.next).overlay() {
                            
                            RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray).padding()
                            
                        }
                        
                        SecureField("Password", text: $passwordTextField).multilineTextAlignment(.leading).font(.headline).padding().padding().textContentType(.newPassword).submitLabel(.next).overlay() {
                            
                            RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray).padding()
                            
                            
                        }
                        
                        SecureField("Confirm Password", text: $confirmPasswordTextField).multilineTextAlignment(.leading).font(.headline).padding().padding().textContentType(.newPassword).submitLabel(.done).overlay() {
                            
                            RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray).padding()
                            
                        
                        }
                        
                        
                        Button {
                            
                            showingMainTabView = true
                            userAccess = true
                            
                        } label: {
                            
                            RoundedRectangle(cornerRadius: 10.0).foregroundColor(.yellow).overlay {
                                Text("Sign Up").font(.headline).fontWeight(.bold).foregroundColor(.primary)
                            }.frame(height: UIScreen.main.bounds.maxX - UIScreen.main.bounds.midX - UIScreen.main.bounds.minX - 130, alignment: .center)
                            
                        }.padding(.top, 40).padding().fullScreenCover(isPresented: $showingMainTabView) {
                            MainTabView()
                        }

                    }
                    
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
