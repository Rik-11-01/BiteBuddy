//
//  orderview.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI

struct orderview: View {
    
    @State private var orderitems = MockData.orderItem
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(orderitems){ appetizers in
                            AppetizersListCell(appetizers: appetizers)
                        }
                        .onDelete(perform: { indexSet in
                            orderitems.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(.insetGrouped)
                    
                    Button{
                        
                    } label:{
                        APButton(title: "9.99- place Order")
                    }
                    .padding(.bottom,25)
                }
                
                if orderitems.isEmpty {
                    EmptyStates(imageName: "empty-order", message: "You have no item in order.\n Please add an appetizer!")
                }
            }
            .navigationTitle("💰 Orders")
        }
    }
}

#Preview {
    orderview()
}
