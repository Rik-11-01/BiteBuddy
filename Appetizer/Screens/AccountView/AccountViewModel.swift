//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Ritik Raman on 29/05/24.
//

import SwiftUI

final class AccountViewModel:ObservableObject{
    @Published var user = User()
    
    @Published var alertitem:AlertItem?
    
    @AppStorage("user") private var userData: Data?
    
    func SaveChange(){
        guard isvalidform else{
            return
        }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData=data
            alertitem=AlertContext.usersavesuccess

        } catch{
            alertitem=AlertContext.invalidUserData
        }
        
    }
    
    func retriveUser(){
        guard let userData=userData else{return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertitem=AlertContext.invalidUserData
        }
    }
    
    var isvalidform: Bool{
        guard !user.FirstName.isEmpty && !user.LastName.isEmpty && !user.Email.isEmpty else {
            alertitem=AlertContext.invalidform
            return false
        }
        guard user.Email.isValidEmail else{
            alertitem=AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
   
}
