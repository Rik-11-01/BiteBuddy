//
//  AppetizersListViewModel.swift
//  Appetizer
//
//  Created by Ritik Raman on 27/05/24.
//

import SwiftUI

final class AppetizersListViewModel: ObservableObject{
    
    @Published var appetizers:[Appetizers]=[]
    @Published var alertitem:AlertItem?
    @Published var isloading:Bool=false

    func getappetizers(){
        
        NetworkManager.shared.GetAppetizers { result  in
            self.isloading=true
            DispatchQueue.main.async{
                self.isloading=false
                switch result {
                case .success(let appetizers):
                    self.appetizers=appetizers
                case .failure(let error):
                    switch error{
                        
                    case .invalidURL:
                        self.alertitem=AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertitem=AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertitem=AlertContext.invalidData
                        
                    case .unabletoComplete:
                        self.alertitem=AlertContext.unabletocomplete
                    }
                    
                }
            }
        }
    }
}

