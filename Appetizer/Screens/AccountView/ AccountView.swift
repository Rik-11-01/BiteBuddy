//
//   AccountView.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewmodel=AccountViewModel()
    @FocusState private var focustextfield:formtextfield?
     
    enum formtextfield{
        case firstname,lastname,email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section( header: Text( "Personal Info")){
                    TextField("First name", text: $viewmodel.user.FirstName)
                        .focused($focustextfield,equals: .firstname)
                        .onSubmit {
                            focustextfield = .lastname
                        }
                        .submitLabel(.next)
                    TextField("Last name", text: $viewmodel.user.LastName)
                        .focused($focustextfield,equals: .lastname)
                        .onSubmit {
                            focustextfield = .email
                        }
                        .submitLabel(.next)
                    TextField("E-mail", text: $viewmodel.user.Email)
                        .focused($focustextfield,equals: .email)
                        .onSubmit {
                            focustextfield = nil
                        }
                        .submitLabel(.continue)
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
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Button{
                        focustextfield=nil
                    }label:{
                        Text("Dismiss")
                    }
                }
            }
        }
            .alert(item: $viewmodel.alertitem){ alertitem in
                Alert(title: alertitem.title, message: alertitem.message, dismissButton: alertitem.dismissButton)
            }
            .onAppear{
                viewmodel.retriveUser()
            }
    }
}

#Preview {
    AccountView()
}
