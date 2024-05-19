//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    static let appetizersURL = baseUrl + "appetizers"
    
    private init(){}
    
    func GetAppetizers(completed: @escaping(Result<[Appetizers],APError>)->Void){
        //guard let url= URL(string: appetizersURL)
    }
}
