//
//  AppetizersListCell.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI

struct AppetizersListCell: View {
    let appetizers:Appetizers
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlstring: appetizers.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120,height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading,spacing: 5){
                Text(appetizers.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizers.price,specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizersListCell(appetizers: MockData.sampleappetizers)
}
