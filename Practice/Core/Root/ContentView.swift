//
//  ContentView.swift
//  Practice
//
//  Created by Ritik Raman on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewmodel:AuthViewModel

    var body: some View {
        Group{
            if viewmodel.usersession != nil{
                Profile_View()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
