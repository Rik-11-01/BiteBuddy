//
//  AppetizersListViewModel.swift
//  Appetizer
//
//  Created by Ritik Raman on 27/05/24.
//

import SwiftUI

@MainActor final class AppetizersListViewModel: ObservableObject{
    
    @Published var appetizers:[Appetizers]=[]
    @Published var alertitem:AlertItem?
    @Published var isloading:Bool=false
    @Published var isshowingdetail=false
    @Published  var selectedappetizer:Appetizers?
    
    //    func getappetizers(){
    //
    //        NetworkManager.shared.GetAppetizers { result  in
    //            self.isloading=true
    //            DispatchQueue.main.async{
    //                self.isloading=false
    //                switch result {
    //                case .success(let appetizers):
    //                    self.appetizers=appetizers
    //                case .failure(let error):
    //                    switch error{
    //
    //                    case .invalidURL:
    //                        self.alertitem=AlertContext.invalidURL
    //
    //                    case .invalidResponse:
    //                        self.alertitem=AlertContext.invalidResponse
    //
    //                    case .invalidData:
    //                        self.alertitem=AlertContext.invalidData
    //
    //                    case .unabletoComplete:
    //                        self.alertitem=AlertContext.unabletocomplete
    //                    }
    //
    //                }
    //            }
    //        }
    //    }
    func getappetizers(){
        self.isloading=true
        Task{
            do{
                appetizers = try await NetworkManager.shared.GetAppetizers()
                isloading=false
            }catch{
                if let apError = error as? APError{
                    switch apError{
                    case .invalidURL:
                        alertitem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertitem = AlertContext.invalidResponse
                    case .invalidData:
                        alertitem = AlertContext.invalidData
                    case .unabletoComplete:
                        alertitem = AlertContext.unabletocomplete
                    }
                }else{
                    alertitem = AlertContext.invalidResponse
                }
                isloading=false
            }
        }
    }
}

