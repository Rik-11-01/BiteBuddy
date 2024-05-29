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
    //network-Alerts
    static let invalidData      = AlertItem(title: Text("Server Error"), message:Text( "Try again later"), dismissButton: .default(Text("ok")))
    static let invalidResponse  = AlertItem(title: Text("Server Error"), message: Text( "The data recievecd is invalid"), dismissButton: .default(Text("ok")))
    static let invalidURL       = AlertItem(title: Text("Server Error"), message: Text( "The data recievecd is invalid"), dismissButton: .default(Text("ok")))
    static let unabletocomplete = AlertItem(title: Text("Server Error"), message: Text( "The data recievecd is invalid"), dismissButton: .default(Text("ok")))
    
    //Account-Alerts
    static let invalidform = AlertItem(title: Text("Invalid Form"), message: Text( "Please ensure all fiels in the form has been filled out."), dismissButton: .default(Text("ok")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text( "Email is invalid"), dismissButton: .default(Text("ok")))

}
