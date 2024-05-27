//
//  Appetizer.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import Foundation

struct Appetizers: Codable,Identifiable {
    //codable ::uses json same script for working else it breaks.
    let id:Int
    let name:String
    let description:String
    let price:Double
    let imageURL:String
    let calories:Int
    let protein:Int
    let carbs:Int
}

struct AppetizerResponse: Decodable{
    let request:[Appetizers]
}

struct MockData{
    static let sampleappetizers = Appetizers(id: 00,
                                             name: "ritk",
                                             description: "raman",
                                             price: 900,
                                             imageURL: "kk",
                                             calories: 2,
                                             protein: 3,
                                             carbs: 4)
    static let appetizers = [sampleappetizers,sampleappetizers,sampleappetizers,sampleappetizers]
}
