//
//  User.swift
//  Practice
//
//  Created by Ritik Raman on 04/07/24.
//

import Foundation

struct FirebaseUser: Identifiable, Codable{
    let id:String
    let fullname:String
    let email:String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components=formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension FirebaseUser{
    static var mock_user = FirebaseUser(id: "01", fullname: "Anjali Dwivedi", email: "ritikraman01@gmail.com")
}
