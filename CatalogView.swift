//
//  HomeScreenUpdated.swift
//  GreenDream
//
//  Created by Nicholas Gordon on 8/2/22.
//

import SwiftUI


var sectionBreak = "_________________________________________"

struct Inventorydisplay: View {
    
    @ObservedObject var cartModel:CartModel
    @ObservedObject var food = Food(name: "apples", price: 1, farm: "Blake's", image: "Apple", qty:1)
    @ObservedObject var catalog:Catalog
    
    var body: some View{
        VStack(){
            
            HStack(){
                
                VStack(){
                    Image(food.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 80)
                    
                    
                    
                    Text(food.name!)
                    
                    Text(food.price, format: .currency(code:"USD"))
                    Text(food.farm!)
                    
                    Button {
                        cartModel.addToCart(food: food)
                        
                    } label: {
                        Image("addToCart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 50)
                    }
                }
            }
            
        }
    }
}



struct CatalogView: View {
    @State private var searchField:String = ""
    
    @StateObject var cartModel:CartModel = CartModel()
    @StateObject var catalog:Catalog = Catalog()
    @StateObject var food = Food(name: "apples", price: 1, farm: "Blake's", image: "Apple", qty:1)
    
    // var sectionBreak = "_________________________________________"
    let columns = [GridItem(.adaptive(minimum: 170), spacing: 2)]
    
    
    var body: some View {
        NavigationView{
            ZStack {

                Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902)
                    .frame(width: 500, height: 320)
                    .offset(y: -450)

                VStack() {

                    Text("Deal of the Day")
                        .font(.system(size: 36))
                        .padding(.bottom, 100)
    
                    HStack() {

                        Menu("Filter") {
                            Button("Sort Z to A", action: catalog.filterByZToA)
                            Button("Sort A to Z", action: catalog.filterByAToZ)
                            Button("Price Low to High", action: catalog.filterByPriceLowHigh)
                            Button("Price High to Low", action: catalog.filterByPriceHighLow)

                        }
                        .padding(.leading, 60)

                        Spacer()
                        ZStack() {

                            //                            if searchField.isEmpty {
                            //                                Text("🔎Search")
                            //                                    .foregroundColor(Color.black)
                            //                                    .bold()
                            //                                    .multilineTextAlignment(.center)
                            //                                    .frame(width: 250, height: 25.0)
                            //                                    .border(.black)
                            //
                            //                            }

                            TextField("🔎Search", text: $searchField)

                        }
                        .foregroundColor(Color.black)
                        .background(Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902))
                        .multilineTextAlignment(.center)
                        .frame(width: 250, height: 5)


                        Spacer()

                        NavigationLink(destination: SettingsView()) {

                            Image(systemName: "person.circle")
                                .font(.system(size: 50))
                                .padding(5)
                                .frame(width: 60, height: 50)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 60)

                    }

                    Text(sectionBreak)

                    ScrollView{
                        LazyVGrid(columns: columns){

                            ForEach(Inventory, id: \.id) {food in
                                Inventorydisplay(cartModel: cartModel, food: food, catalog: catalog)

                            }
                        }
                    }
             

                    Text(sectionBreak)
                    ZStack {

                    NavigationLink(destination: CheckoutView(cartModel: cartModel, food: food)


                    ) {
                        Image(systemName: "cart")
                            .buttonStyle(.plain)
                            .font(.system(size: 50))
                            .padding(10)
                            .frame(width: 60, height: 40)
                            .foregroundColor(Color(red: 0.7568627450980392, green: 0.8352941176470589, blue: 0.5607843137254902))
                    }
                        
                        Text(String(qtytotal))
                            .frame(width:20, height:20)
                            .background(.red)
                            .foregroundColor(.white)
                            .offset(x:22, y:-15)
                            
                    }
                }
            }
        }
       
    }
}
struct HomeScreenUpdated_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
