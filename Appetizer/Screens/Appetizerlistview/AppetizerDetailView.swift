//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Ritik Raman on 29/05/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order : Order
    
    let appetizer:Appetizers
    @Binding var isshowingdetail :Bool
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlstring: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width:300 ,height:225 )
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack{
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)

                }
            }
            Spacer()
            Button{
                order.add(appetizer)
            } label:{
                APButton(title: "$\(appetizer.price,specifier: "%.2f")-Add to Order")
                    
            }
            .padding(.bottom,30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isshowingdetail=false
        }label:{
           APxdismissbutton()
        },alignment: .topTrailing)
    }
}

struct NutritionInfo:View{
    let title :String
    let value:Int
    var body: some View{
        VStack(spacing:5){
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleappetizers,isshowingdetail: .constant(true))
}

