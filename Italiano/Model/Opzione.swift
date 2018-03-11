//
//  Opzione.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import Foundation

class Opzione : Encodable, Decodable, Equatable {
    static func ==(lhs: Opzione, rhs: Opzione) -> Bool {
        if lhs.parola == rhs.parola { return true }
        else { return false }
    }
    
    var parola : String
//    var isCorretta : Bool {
//        if eserciziGiusta?.count == 0 { return false }
//        else { return true }
//    }
    var eserciziGiusta : [Int]?
    
    init(parola: String, esercizi : [Int]?) {
        self.parola = parola
        self.eserciziGiusta = esercizi
    }
}
