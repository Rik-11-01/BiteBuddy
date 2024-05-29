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
                    TextField("First name", text: $viewmodel.FirstName)
                    TextField("Last name", text: $viewmodel.LastName)
                    TextField("E-mail", text: $viewmodel.Email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthday",selection: $viewmodel.BirthDate, displayedComponents: .date)
                    Button{
                        viewmodel.SaveChange()
                    }label:{
                        Text("Save changes")
                    }
                }
                Section(header: Text("Requests")){
                    Toggle("Extra Napkin", isOn: $viewmodel.ExtraNapkin)
                    Toggle("Frequent Refills", isOn: $viewmodel.FrequentRefill)
                }
                .toggleStyle(SwitchToggleStyle(tint : .brandPrimary))
            }
            .navigationTitle("🧑‍💼 Account")
            .alert(item: $viewmodel.alertitem){ alertitem in
                Alert(title: alertitem.title, message: alertitem.message, dismissButton: alertitem.dismissButton)
            }
        }
    }
}

#Preview {
    AccountView()
}
