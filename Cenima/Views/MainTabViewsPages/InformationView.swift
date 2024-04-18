//
//  InformationView.swift
//  Cenima
//
//  Created by RMP on 06/10/1445 AH.
//

import SwiftUI
import BottomSheetSwiftUI

struct InformationView: View {
    
    
    @State var bottomSheetPositionHidden: BottomSheetPosition = .hidden
    
    @State var bottomSheetPositionShow: BottomSheetPosition = .absolute(200.0)
    
    // Apple way
    @Environment(\.dismiss) var dismiss
    
    // My way
    @Environment(\.dismiss) var myDismiss: DismissAction
    
    
    @State var showingBottomSheet: Bool = false
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor).frame(width: 30, height: 30, alignment: .center).overlay {
                        
                        Image(systemName: "person.fill").foregroundColor(.white)
                        
                    }
                    
                    Text("example@example.com").foregroundColor(.primary).bold()
                    
                }.frame(height: 40)
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.orange).frame(width: 30, height: 30, alignment: .center).overlay {
                        
                        Image(systemName: "location.fill").foregroundColor(.white)
                        
                    }
                    
                    Text("United State, California").foregroundColor(.primary).bold()
                    
                }.frame(height: 40)
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.green).frame(width: 30, height: 30, alignment: .center).overlay {
                        
                        Image(systemName: "square.and.arrow.up.fill").foregroundColor(.white)
                        
                    }
                    
                    Text("Share").foregroundColor(.primary).bold()
                    
                }.frame(height: 40)
                
                
                Button {
                    
                    
                    showingBottomSheet.toggle()
                    
                    
                } label: {
                    
                    HStack {
                        
                        
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.mint).frame(width: 30, height: 30, alignment: .center).overlay {
                            
                            Image(systemName: "envelope.fill").foregroundColor(.white)
                            
                        }
                        
                        Text("Contact Us").foregroundColor(.primary).bold()

                        
                    }.frame(height: 40)
                    
                }
                  
                
            }.navigationTitle("Info").navigationBarTitleDisplayMode(.large).toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    
                    Button("Cancel", role: .cancel) {
                        
                        dismiss()
                        myDismiss.callAsFunction()
                        
                    }
                    
                }
                
            }.bottomSheet(bottomSheetPosition: showingBottomSheet ? $bottomSheetPositionShow : $bottomSheetPositionHidden, switchablePositions: showingBottomSheet ? [.absolute(200.0)] : [.hidden], title: "Contact Us") {
                
                VStack {
                    
                    Text("+000-000-0000").bold()
                    
                    Button {
                        //
                    } label: {
                        
                        Image(systemName: "phone.circle.fill").resizable().frame(width: UIScreen.main.bounds.minX + UIScreen.main.bounds.midX / 3, height: 60, alignment: .center).foregroundColor(.green)
                        
                    }

                    
                }
                
            }
            
        }
        
    }
    
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
