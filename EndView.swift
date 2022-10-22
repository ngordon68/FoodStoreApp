//
//  EndView.swift
//  GreenDream
//
//  Created by Nicholas Gordon on 7/28/22.
//

import SwiftUI

var thankyou = "Thank you for Shopping!"
var thankyou2 = "Your purchase helped support the Michigan Urban Farming Initiative."

struct EndView: View {
    var body: some View {
        VStack(){
            
            Image("urbanFarm")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .border(.black, width: 2)
                .padding()
            
            VStack(){
                Text("Thank you for shopping!")
                    .bold()
                    .font(.system(size: 24))
                
                Text(thankyou2)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 30)
                
                Text("Please shop again!")
                    .bold()
                    .font(.system(size: 20))
                Spacer()
                    .frame(height: 60)
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220)
            }
            
        }
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
