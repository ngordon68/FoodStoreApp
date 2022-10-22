//
//  Confirmation screen.swift
//  GreenDream
//
//  Created by Nicholas Gordon on 7/28/22.
//

import SwiftUI


struct PaymentView: View {
    
    @State private var cardName:String = ""
    @State private var cardNumber:String = ""
    @State private var cardCode:String = ""
    @State private var streetAddress:String = ""
    @State private var zipcode:String = ""
    @State private var cardExp:String = ""
    @State private var emailAddress:String = ""
    @State private var phoneNumber:String = ""
    @State private var city:String = ""
    @State private var state:String = ""
    
    
    var body: some View {
        ZStack {
            
            Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902)
                .frame(width: 500, height: 320)
                .offset(y: -450)
            
            VStack(){
                
                Spacer()
                
                Group{
                    Text("Payment")
                        .font(.system(size: 36))
                        .padding(.bottom, 150)
                        .frame(width: 500, height: 50)
                        .offset(y:-40)
                    
                    
                    NavigationLink(destination: SignInView()) {
                        Text("Sign in for best Experience")
                            .frame(width: 300, height:50 )
                            .background(Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902))
                            .cornerRadius(15)
                            .foregroundColor(.black)
                    }
                }
                
                VStack(spacing: 5) {
                    Group {
                        
                        TextField("Name on Card", text: $cardName)
                            .padding(.leading, 5.0)
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .strokeBorder()
                                .foregroundColor(.black))
                            .padding(10)
                            .frame(width: 350)
                        
                        
                        
                        TextField("Card Number", text: $cardNumber)
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .strokeBorder()
                                .foregroundColor(.black))
                            .padding(10)
                            .frame(width: 350)
                        
                        HStack(spacing:50){
                            TextField("Exp. Date", text: $cardExp)
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder()
                                    .foregroundColor(.black))
                                .padding(10)
                                .padding(.leading, 50)
                            
                            
                            TextField("Security Code", text: $cardCode)
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder()
                                    .foregroundColor(.black))
                                .padding(10)
                                .padding(.trailing, 50)
                            
                            
                        }
                        
                        TextField("StreetAddress", text: $streetAddress)
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .strokeBorder()
                                .foregroundColor(.black))
                            .padding(10)
                            .frame(width: 350)
                        
                        
                        HStack{
                            TextField("City", text: $city)
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder()
                                    .foregroundColor(.black))
                                .padding(10)
                                .frame(width: 150)
                                .padding(.leading, 50)
                            
                            TextField("State", text: $state)
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder()
                                    .foregroundColor(.black))
                                .padding(10)
                                .frame(width: 100)
                            
                            
                            TextField("Zip Code", text: $zipcode)
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder()
                                    .foregroundColor(.black))
                                .padding(10)
                                .padding(.trailing, 50)
                        }
                    }
                
                }
                
                NavigationLink(destination: EndView()) {
                    Image("submitPayment")
                        .padding(.bottom, 150)
                    
                }
                
            }
            
        }
        
    }
    
    struct PaymentView_Previews: PreviewProvider {
        static var previews: some View {
            PaymentView()
        }
    }
}
