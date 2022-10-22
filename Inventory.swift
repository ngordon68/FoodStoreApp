//
//  Inventory.swift
//  GreenDream
//
//  Created by Marcey Carroll on 8/1/22.
//

import Foundation
import UIKit


class Food: Identifiable, ObservableObject {
    @Published var name: String?
    @Published var price: Float
    @Published var farm: String?
    @Published var image: String?
    @Published var qty: Int
    
    
    init( name:String, price:Float, farm:String, image:String, qty:Int)
    {
        self.name = name
        self.price = price
        self.farm = farm
        self.image = image
        self.qty = qty
        
    }
}

var apples = Food(name: "apples", price: 1, farm: "Blake's", image: "Apple", qty:1)
var onions = Food(name: "onions", price: 0.60, farm: "Onion Bros.", image: "Onion", qty:1)
var tomatoes = Food(name: "tomatoes", price: 0.80, farm: "Detroit Farm", image: "Tomatoe", qty:1)
var carrots = Food(name: "carrots", price: 3, farm: "J&M Farms", image: "Carrot", qty:1)
var cucumbers = Food(name: "cucumber", price: 1, farm: "Green Growers", image: "Cucumber", qty:1)
var blueberries = Food(name: "blueberries", price: 4, farm: "Blue Skies", image: "Blueberry", qty:1)
var zucchini = Food(name: "zucchini", price: 0.90, farm: "ZJE Farms", image: "Zuc", qty:1)
var bananas = Food(name: "bananas", price: 2, farm: "Detroit Farm", image: "Bananna", qty:1)
var strawberries = Food(name: "strawberries", price: 4, farm: "Blue Skies", image: "Strawberry", qty:1)
var greenbeans = Food(name: "green beans", price: 2, farm: "Green Growers", image: "GreenBean", qty:1)


var Inventory = [
    apples, onions, tomatoes, carrots, cucumbers, blueberries, zucchini, bananas, strawberries, greenbeans
]


class Catalog: ObservableObject {
    @Published var classInventory = [
        apples, onions, tomatoes, carrots, cucumbers, blueberries, zucchini, bananas, strawberries, greenbeans
    ]
    
    
    func filterBySearch(userInput:String) {
        //check to see if any items match user input
        if Inventory.contains(where: {$0.name == userInput}) {
            let i = Inventory.firstIndex(where: {$0.name == userInput})
            Inventory = [Inventory[i!]]
            classInventory = Inventory
        } else {
            
            print("No seach results")
        }
    }
    
    
    func filterByPriceHighLow(){
        Inventory = Inventory.sorted(by: {$0.price > $1.price})
        
        classInventory = Inventory
    }
    
    func filterByPriceLowHigh(){
        Inventory = Inventory.sorted(by: {$0.price < $1.price})
        
        classInventory = Inventory
    }
    
    func filterByAToZ(){
        Inventory = Inventory.sorted(by: {$0.name! < $1.name!})
        
        classInventory = Inventory
        
        
    }
    
    func filterByZToA(){
        Inventory = Inventory.sorted(by: {$0.name! > $1.name!})
        
        classInventory = Inventory
        
        
    }
    
    func filterSearch(){
        Inventory = Inventory.filter({$0.name! == ""})
        
        classInventory = Inventory
        
    }
    
    
}  //class ends here


// makes class hashable which lets us to compare values in array such as to see if duplicate already exists

extension Food : Hashable {
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.name == rhs.name }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        
    }
}


