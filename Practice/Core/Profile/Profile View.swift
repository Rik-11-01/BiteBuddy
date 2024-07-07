//
//  Profile View.swift
//  Practice
//
//  Created by Ritik Raman on 04/07/24.
//

import SwiftUI

struct Profile_View: View {
    @EnvironmentObject var viewmodel : AuthViewModel
    var body: some View {
        if let user=viewmodel.currentuser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72,height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading ,spacing: 4){
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            Text(user.email)
                                .font(.footnote)
                                .tint(.gray)
                        }
                    }
                }
                Section("General"){
                    HStack{
                        SettingRowView(imagename: "gear", title: "Version", tintcolor: .gray)
                        
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                    }
                }
                Section("Account"){
                    Button{
                        viewmodel.SignOut()
                    }label:{
                        SettingRowView(imagename: "arrow.left.circle.fill", title: "Sign Out", tintcolor: .red)
                    }
                    Button{
                        
                    }label:{
                        SettingRowView(imagename: "xmark.circle.fill", title: "Delete Account", tintcolor: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    Profile_View()
}
