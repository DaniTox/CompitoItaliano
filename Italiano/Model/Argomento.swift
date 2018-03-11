//
//  Argomento.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import Foundation

class Argomento : Encodable, Decodable {
    var titolo : String
    var body : String
    
    init(titolo: String, body : String) {
        self.titolo = titolo
        self.body = body
    }
}
