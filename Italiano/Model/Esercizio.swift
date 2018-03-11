//
//  Esercizio.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import Foundation

class Esercizio: Encodable, Decodable, Equatable {
    static func ==(lhs: Esercizio, rhs: Esercizio) -> Bool {
        if lhs.id == rhs.id && lhs.frase == rhs.frase { return true }
        return false
    }
    
//    var hashValue: Int {
//        return id.hashValue &* 16777619
//    }
    
//    static func ==(lhs: Esercizio, rhs: Esercizio) -> Bool {
//        if lhs.id == rhs.id { return true}
//        return false
//    }
    
    public var frase : String
    private var opzioni : [Opzione]
    
    public var fraseGiusta : String {
        return frase.replacingOccurrences(of: "[...]", with: parolaGiusta)
    }
    
    private var parolaGiusta : String {
        var par = "NULL"
        for opz in opzioni {
            if opz.eserciziGiusta?.first! == self.id {
                par = opz.parola
                break
            }
            
        }
        return par.uppercased()
    }
    
    public var id : Int
    
    init(fraseRaw : String, opzioni: [Opzione], id : Int) {
        self.frase = fraseRaw
        self.opzioni = opzioni
        self.id = id
    }
    
//    var numCorrette : Int {
//        if frase.contains("[...]") {
//            let num = frase.components(separatedBy: "[...]")
//            return num.count - 1
//        }
//        return 0
//    }
    
//    var corrette : [Opzione] {
//        return opzioni.filter({ $0.isCorretta == true })
//    }
//
    
}
