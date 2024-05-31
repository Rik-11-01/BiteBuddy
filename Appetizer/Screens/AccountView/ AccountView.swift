//
//   AccountView.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewmodel=AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section( header: Text( "Personal Info")){
                    TextField("First name", text: $viewmodel.user.FirstName)
                    TextField("Last name", text: $viewmodel.user.LastName)
                    TextField("E-mail", text: $viewmodel.user.Email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthday",selection: $viewmodel.user.BirthDate, displayedComponents: .date)
                    Button{
                        viewmodel.SaveChange()
                    }label:{
                        Text("Save changes")
                    }
                }
                Section(header: Text("Requests")){
                    Toggle("Extra Napkin", isOn: $viewmodel.user.ExtraNapkin)
                    Toggle("Frequent Refills", isOn: $viewmodel.user.FrequentRefill)
                }
                .toggleStyle(SwitchToggleStyle(tint : .brandPrimary))
            }
            .navigationTitle("🧑‍💼 Account")
            .alert(item: $viewmodel.alertitem){ alertitem in
                Alert(title: alertitem.title, message: alertitem.message, dismissButton: alertitem.dismissButton)
            }
            .onAppear{
                viewmodel.retriveUser()
            }
        }
    }
}

#Preview {
    AccountView()
}
