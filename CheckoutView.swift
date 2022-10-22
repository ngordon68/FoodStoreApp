//
//  CheckoutView.swift
//  GreenDream
//
//  Created by Nicholas Gordon on 7/27/22.
//
import SwiftUI


struct CheckoutView: View {
    @ObservedObject var cartModel:CartModel = CartModel()
    @ObservedObject var food = Food(name: "apples", price: 1, farm: "Blake's", image: "Apple", qty:1)
    
    var sectionBreak = "_________________________________________"
    
    var body: some View {
        VStack() {
            Text("Checkout")
                .font(.system(size: 36))
                .padding(.bottom, 100)
                .frame(width: 500, height: 50)
                .background(Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902))
            
            ScrollView(){
                
                
                if (cart.isEmpty) {
                    Text("Your cart is empty!")
                        .foregroundColor(Color.black)
                        .font(.system(size:18))
                } else {
                    
                    ForEach(cart) { food in
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 0){
                                Image(food.image!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 220, height: 100)
                                
                                Text(String(food.qty))
                                    .frame(width: 200, height: 10)
                                    .padding(10)
                                
                                HStack{
                                    Spacer()
                                        .frame(width: 50)
                                    Button {
                                        
                                        cartModel.decreaseQTY(food:food)
                                        
                                    } label: {
                                        Image(systemName: "minus.rectangle")
                                            .foregroundColor(Color.black)
                                            .font(.system(size:24))
                                            .padding()
                                        
                                    }
                                    Button {
                                        
                                        cartModel.increaseQTY(food:food)
                                        
                                    } label: {
                                        Image(systemName: "plus.rectangle")
                                            .foregroundColor(Color.black)
                                            .font(.system(size:24))
                                        
                                    }
                                    
                                }
                                
                            }
                            Spacer()
                            
                            Text((food.price * Float(food.qty)), format: .currency(code: "USD"))
                                .padding(30)
                            Spacer()
                        }
                        
                    }
                    
                    
                }
                
            }
            Spacer()
            Text(sectionBreak)
            
            HStack(){
                
                
                Spacer()
                
                Text("Total of \(qtytotal) Items")
                
                
                Spacer()
                    .frame(width: 200)
                
                //total of everythimg
                Text(total, format: .currency(code:"USD"))
                
                Spacer()
                
                
            }
            Group() {
                HStack(){
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: PaymentView()) {
                        Image(systemName: "creditcard")
                            .font(.system(size: 70))
                            .padding(10)
                            .frame(width: 60, height: 50)
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(width: 50)
                    
                    NavigationLink(destination: PaymentView()) {
                        Image("Ebt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                        
                    }
                    Spacer()
                    
                    
                    NavigationLink(destination: PaymentView()) {
                        Image("Applepay")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                        
                    }
                    
                    
                    
                    Spacer()
                }
            }
        }
    }
}
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}




