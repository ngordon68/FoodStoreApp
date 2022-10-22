//
//  CartArray.swift
//  GreenDream
//
//  Created by India Doria on 8/2/22.
//

import Foundation
import UIKit
import SwiftUI


var cart = [Food]()
var total:Float = 0
var qtytotal:Int = 0


class CartModel: ObservableObject {
    
    @Published var classCart = [Food]()
    @Published var classTotal: Float = 0
    @Published var classQtyTotal:Int = 0
    


    func increaseQTY(food: Food){

        food.qty += 1
        total += food.price
        qtytotal += 1
        
       
        classTotal = total

    

        
    }
    func decreaseQTY(food: Food){
        if (food.qty > 1) {
            let ndx = cart.firstIndex(where: {$0.qty == food.qty})
            cart[ndx!].qty = food.qty
                        food.qty -= 1
                        total -= food.price
                        qtytotal -= 1
                        classTotal = total
            
        } else if let i = cart.firstIndex(where: {$0.name == food.name}) {
            total -= food.price
            qtytotal -= 1
                        classTotal = total
                        cart.remove(at: i)
            
        } else {
            print("this is broken")
        }


    }
    
    func addToCart(food: Food) {
       
        if let ndx = cart.firstIndex(where: {$0.name == food.name}) {
            // already have this cart/item, do an update here
            cart[ndx].price = food.price
            cart[ndx].qty = food.qty
            food.qty += 1
            total += food.price
            qtytotal += 1
            
            classTotal = total
            classCart = cart
            classQtyTotal = qtytotal


        } else {
          //   add a new cart/item
            cart.append(food)
            total += food.price
            qtytotal += 1
         
           
            classTotal = total
            classCart = cart
            classQtyTotal = qtytotal
            
            
      }
    }
    
}









