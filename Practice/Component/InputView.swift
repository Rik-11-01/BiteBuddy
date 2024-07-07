//
//  InputView.swift
//  Practice
//
//  Created by Ritik Raman on 30/06/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text : String
    let title:String
    let placeholder:String
    var issecurefield = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 12){
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if issecurefield{
                SecureField(placeholder,text: $text)
                    .font(.system(size:14))
            }else{
                TextField(placeholder,text: $text)
                    .font(.system(size:14))
            }
            Divider()
        }
    }
    
}

#Preview {
    InputView(text: .constant(""), title: "Email", placeholder: "example@gmail.com")
}
