//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Ritik Raman on 19/05/24.
//

import Foundation
import UIKit

final class NetworkManager{
    
    static let shared = NetworkManager()
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseUrl + "appetizers"
    
    private let cache = NSCache<NSString,UIImage>()
    
    private init(){}
    
//    func GetAppetizers(completed: @escaping(Result<[Appetizers],APError>)->Void){
//        guard let url = URL(string: appetizersURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task=URLSession.shared.dataTask(with: URLRequest(url: url)) { data,response,error in
//            if let _ = error {
//                completed(.failure(.unabletoComplete))
//                return
//            }
//            guard let response = response as? HTTPURLResponse,response.statusCode==200 else{
//                completed(.failure(.invalidResponse))
//                return
//            }
//            guard let data = data else{
//                completed(.failure(.invalidData))
//                return
//            }
//            do {
//                let decoder=JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch{
//                completed(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    //Using Concurrency for network Call that is using async /await
    
    func GetAppetizers() async throws ->[Appetizers]{
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }
        let ( data , _ ) = try await URLSession.shared.data(from: url)
            do {
                let decoder=JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                return decodedResponse.request
            } catch{
                throw APError.invalidData
            }
        }
    
    func downloadImage(fromurlstring : String,completed:@escaping(UIImage?)->Void){
        
        let cachekey = NSString(string: fromurlstring)
        
        if let image = cache.object(forKey: cachekey){
            completed(image)
            return
        }
        
        guard let url = URL(string:fromurlstring) else{
            completed(nil)
            return
        }
        let task=URLSession.shared.dataTask(with: URLRequest(url: url)) { data,response,error in
            guard let data = data,let image=UIImage(data: data)else{
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cachekey)
            completed(image)
            
        }
        
        task.resume()
        
    }
}
