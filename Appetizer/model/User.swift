//
//  User.swift
//  Appetizer
//
//  Created by Ritik Raman on 01/06/24.
//

import Foundation

struct User:Codable{
    var FirstName       = ""
    var LastName        = ""
    var Email           = ""
    var BirthDate       = Date()
    var ExtraNapkin     = true
    var  FrequentRefill = false
}
