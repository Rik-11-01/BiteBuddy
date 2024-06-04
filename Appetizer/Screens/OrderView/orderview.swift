//
//  orderview.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI

struct orderview: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizers in
                            AppetizersListCell(appetizers: appetizers)
                        }
                        .onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(.insetGrouped)
                    
                    Button{
                        
                    } label:{
                        APButton(title:"$\(order.totalprice,specifier:" %.2f" )-Place Order")
                    }
                    .padding(.bottom,25)
                }
                
                if order.items.isEmpty {
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
