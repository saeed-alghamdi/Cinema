//
//  TestingToastMessagesView.swift
//  Cenima
//
//  Created by RMP on 23/09/1445 AH.
//

import SwiftUI
import ToastSwiftUI

struct TestingToastMessagesView: View {
    
    
    @State private var isToastPresenting: Bool = false
    
    var body: some View {
        
        Button("Click Here") {
            
            isToastPresenting = true
            
        }.toast(isPresenting: $isToastPresenting, message: "Waiting", icon: .custom(Image(systemName: "exclamationmark.square.fill").resizable())).frame(width: 300, alignment: .center)
        
    }
    
}

struct TestingToastMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        TestingToastMessagesView()
    }
}
