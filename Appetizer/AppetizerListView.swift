//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewmodel=AppetizersListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewmodel.appetizers){ appetizers in
                    AppetizersListCell(appetizers: appetizers)
                }
                .navigationTitle("Appetizers")
            }
            .onAppear(){
                viewmodel.getappetizers()
            }
            if viewmodel.isloading{
                LoadingView()
            }
           
        }
        .alert(item: $viewmodel.alertitem){ alertItem in
            Alert(title:alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}
