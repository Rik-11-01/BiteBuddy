//
//  AppetizersListViewModel.swift
//  Appetizer
//
//  Created by Ritik Raman on 27/05/24.
//

import SwiftUI

final class AppetizersListViewModel: ObservableObject{
    
    @Published var appetizers:[Appetizers]=[]

    func getappetizers(){
        NetworkManager.shared.GetAppetizers { result  in
            DispatchQueue.main.async{
                switch result {
                case .success(let appetizers):
                    self.appetizers=appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

