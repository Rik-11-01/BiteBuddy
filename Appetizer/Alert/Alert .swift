//
//  Alert .swift
//  Appetizer
//
//  Created by Ritik Raman on 27/05/24.
//

import SwiftUI

struct AlertItem:Identifiable{
    let id=UUID()
    let title:Text
    let message:Text
    let dismissButton:Alert.Button
}

struct AlertContext{
    static let invalidData      = AlertItem(title: Text("Server Error"), message:Text( "Try again later"), dismissButton: .default(Text("ok")))
    static let invalidResponse  = AlertItem(title: Text("Server Error"), message: Text( "The data recievecd is invalid"), dismissButton: .default(Text("ok")))
    static let invalidURL       = AlertItem(title: Text("Server Error"), message: Text( "The data recievecd is invalid"), dismissButton: .default(Text("ok")))
    static let unabletocomplete = AlertItem(title: Text("Server Error"), message: Text( "The data recievecd is invalid"), dismissButton: .default(Text("ok")))

}
