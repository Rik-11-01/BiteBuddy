//
//  APButton.swift
//  Appetizer
//
//  Created by Ritik Raman on 29/05/24.
//

import SwiftUI

struct APButton: View {
    let title :LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260,height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(12)
    }
}

#Preview {
    APButton(title:"ok")
}
