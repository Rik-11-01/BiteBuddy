//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Ritik Raman on 29/05/24.
//

import SwiftUI

final class AccountViewModel:ObservableObject{
    @Published var FirstName = ""
    @Published var LastName = ""
    @Published var Email = ""
    @Published var BirthDate = Date()
    @Published var ExtraNapkin = true
    @Published var  FrequentRefill = false
    
    @Published var alertitem:AlertItem?
    
    var isvalidform: Bool{
        guard !FirstName.isEmpty && !LastName.isEmpty && !Email.isEmpty else {
            alertitem=AlertContext.invalidform
            return false
        }
        guard Email.isValidEmail else{
            alertitem=AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func SaveChange(){
        guard isvalidform else{
            return
        }
        print("Changes have saved.")
        
    }
}
