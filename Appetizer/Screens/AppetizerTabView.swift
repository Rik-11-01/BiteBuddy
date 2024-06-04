//
//  ContentView.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            orderview()
                .tabItem {
                    Image(systemName: "bag")
                    Text("order")
                }
                .badge(order.items.count)
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
    }
}

#Preview {
    AppetizerTabView()
}
