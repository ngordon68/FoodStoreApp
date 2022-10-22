//
//  SpashScreen.swift
//  GreenDream
//
//  Created by Nicholas Gordon on 7/27/22.
//

import SwiftUI

struct SpashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var appName = "Green Dream"

    var body: some View {
        if isActive {
            CatalogView()
            
        }
        else {
        VStack(){
            VStack(){
                
                Image("Logo")
                

                }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                
                    self.size = 1.2
                    self.opacity = 0.9
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation{
                self.isActive = true
                
                }
        }
        }
        }
            
            
            
        
        
}
     
struct SpashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpashScreen()
    }
}
}

