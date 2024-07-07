//
//  LoginView.swift
//  Practice
//
//  Created by Ritik Raman on 30/06/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewmodell : AuthViewModel
    var body: some View {
        NavigationStack{
            VStack{
                //image
                Image("photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 120)
                    .padding(.vertical,32)
                //form
                VStack(spacing:24){
                    InputView(text: $email, title: "Email Address", placeholder: "name@gmail.com")
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    InputView(text: $password, title: "PassWord", placeholder: "Enter your Password",issecurefield: true)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                
                //sign in button
                Button{
                    //ACTION TO SIGN IN::
                    Task{
                      try await viewmodell.SignIn(withEmail: email, password: password)
                    }
                }label:{
                    HStack{
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: 360 ,height: 48)
                }
                .background(Color(.systemBlue))
                .clipShape(.buttonBorder)
                .padding(.top,24)
                
                Spacer()
                //sign up button
                NavigationLink{
                    Registration_View()
                        .navigationBarBackButtonHidden()
                }label:{
                    HStack(spacing:3){
                        Text("Don't have an account ? ")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
