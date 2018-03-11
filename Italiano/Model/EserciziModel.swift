//
//  EserciziManager.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import Foundation

class EserciziModel {
    
    func getEx(currentIndex : Int?, completion : ((Int) -> Void)?) -> Esercizio? {
        if currentIndex == nil {
            completion?(currentIndex ?? -1)
            return esercizi[0]
        }
        if (currentIndex! + 1) < (esercizi.count) {
            completion?(currentIndex ?? 0)
            return esercizi[currentIndex! + 1]
        }
        if (currentIndex! + 1) >= esercizi.count {
            return nil
        }
        return nil
    }
    
    func setMyAnswer(_ answer : Opzione, for exer: Esercizio) {
        resultDict[exer.id] = answer
    }
    
    func isLastEx(index : Int) -> Bool {
        if index == (esercizi.count - 1) {
            return true
        } else {
            return false
        }
    }
    
    func calculateAnswers() -> Int {
        var count = 0
        for (index, opz) in resultDict {
            if esercizi[index].id == opz.eserciziGiusta![0] {
                count += 1
            }
        }
        return count
    }
    
}


var resultDict : [Int : Opzione] = [:] {
    didSet {
        print("resultDict modified")
    }
}
