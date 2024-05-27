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
    private let appetizersURL = baseUrl + "appetizers"
    
    private init(){}
    
    func GetAppetizers(completed: @escaping(Result<[Appetizers],APError>)->Void){
        guard let url = URL(string: appetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task=URLSession.shared.dataTask(with: URLRequest(url: url)) { data,response,error in
            if let _ = error {
                completed(.failure(.unabletoComplete))
                return
            }
            guard let response = response as? HTTPURLResponse,response.statusCode==200 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder=JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
