//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI
import Firebase

@main
struct AppetizerApp: App {
    var order = Order()
    @StateObject var viewmodell = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
        //    AppetizerTabView().environmentObject(order)
            ContentView()
                .environmentObject(viewmodell)
                .environmentObject(order)
        }
    }
}
