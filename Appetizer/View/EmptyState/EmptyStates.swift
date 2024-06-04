//
//  EmptyStates.swift
//  Appetizer
//
//  Created by Ritik Raman on 01/06/24.
//

import SwiftUI

struct EmptyStates: View {
    let imageName: String
    let message:String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image(imageName)
                    .resizable()
                //    .scaledToFill()
                    .frame(width:200,height:160)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y:-70)
        }
    }
}

#Preview {
    EmptyStates(imageName: "empty-order", message: "hi i am Ritik Raman")
}
