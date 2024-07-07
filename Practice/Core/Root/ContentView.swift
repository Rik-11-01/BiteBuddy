//
//  ContentView.swift
//  Practice
//
//  Created by Ritik Raman on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewmodell:AuthViewModel

    var body: some View {
        Group{
            if viewmodell.usersession != nil{
                AppetizerTabView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
