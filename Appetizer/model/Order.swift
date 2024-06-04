//
//  Order.swift
//  Appetizer
//
//  Created by Ritik Raman on 04/06/24.
//
import SwiftUI

final class Order: ObservableObject {
    @Published var items:[Appetizers]=[]
    
    func add(_ appetizer:Appetizers){
        items.append(appetizer)
    }
    var totalprice:Double{
        items.reduce(0){$0 + $1.price }
    }
}

