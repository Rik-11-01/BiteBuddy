//
//  Registration View.swift
//  Practice
//
//  Created by Ritik Raman on 04/07/24.
//

import SwiftUI

struct Registration_View: View {
    @State private var email = ""
    @State private var name = ""
    @State private var password = ""
    @State private var confirm_password = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewmodell:AuthViewModel
    
    var body: some View {
        VStack{
            //image
            Image("photo")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 120)
                .padding(.vertical,32)
            VStack(spacing:24){
                InputView(text: $email, title: "Email Address", placeholder: "name@gmail.com")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                InputView(text: $name, title: "Full Name", placeholder: "Enter your Name",issecurefield: false)
                
                InputView(text: $password, title: "PassWord", placeholder: "Enter your Password",issecurefield: true)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                ZStack(alignment: .trailing){
                    InputView(text: $confirm_password, title: "Confirm PassWord", placeholder: "Enter your Password",issecurefield: true)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    if !password.isEmpty && !confirm_password.isEmpty{
                        if password==confirm_password{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemGreen))
                        }else{
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemRed))
                        }
                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            //Button
            Button{
                Task{
                    try await viewmodell.createuser(withEmail:email,password:password,fullname:name)
                }
            }label:{
                HStack{
                    Text("Sign Up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .frame(width: 360 ,height: 48)
            }
            .background(Color(.systemBlue))
            .clipShape(.buttonBorder)
            .padding(.top,24)
            
        }
        Spacer()
        
        Button{
            dismiss()
        }label:{
            HStack(spacing:3){
                Text("ALready have an account ? ")
                Text("Sign In")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
    }
}

#Preview {
    Registration_View()
}
