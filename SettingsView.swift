//
//  SettingsView.swift
//  GreenDream
//
//  Created by Nick Gordon on 8/27/22.
//

import SwiftUI

struct Settings: Identifiable {
    
    let name: String
    let image: Image
    let id = UUID()
    let view: AnyView
    
    
}
private var settingsLayout = [
    
    Settings(name: "Perferences", image: Image(systemName: "gear"), view: AnyView(LocationView())),
    Settings(name: "Billing Options", image: Image(systemName: "creditcard"), view: AnyView(LocationView())),
    Settings(name: "Contact Support", image: Image(systemName: "headphones.circle.fill"), view: AnyView(LocationView())),
    Settings(name: "Terms & Conditions", image: Image(systemName: "list.bullet.rectangle.fill"), view: AnyView(LocationView())),
    Settings(name: "About Us", image: Image(systemName: "person.3.fill"), view: AnyView(LocationView())),
    Settings(name: "Log Out", image: Image(systemName: "arrow.left.square"), view: AnyView(LocationView()))
]


struct SettingDisplay: View {
    var settings = Settings(name: "Perferences", image: Image(systemName: "gear"), view: AnyView(LocationView()))
    var body: some View {
       
            
        HStack() {
            Text(settings.image)
            Text(settings.name)
            NavigationLink(destination: settings.view){}
            
        }
            .frame(height:85)
    
        }
    }


struct SettingsView: View {
    var body: some View {
        
        
        ZStack {
            Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902)
                .offset(y: -350)
                .edgesIgnoringSafeArea(.top)
               
            
            VStack {
            
                Text("Account Settings")
                    .font(.system(size: 36))
                    .offset(y:20)
                   
                
               List {
                    ForEach(settingsLayout) { Settings in
                        SettingDisplay(settings:Settings)
                   }
                }
               .frame(height: 700)
                
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
