//
//  APxdismissbutton.swift
//  Appetizer
//
//  Created by Ritik Raman on 29/05/24.
//

import SwiftUI

struct APxdismissbutton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30,height:30 ,alignment: .topTrailing)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44,height: 44)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    APxdismissbutton()
}
