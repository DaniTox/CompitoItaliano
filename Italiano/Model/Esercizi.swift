//
//  Esercizi.swift
//  Italiano
//
//  Created by Dani Tox on 09/03/18.
//  Copyright © 2018 Dani Tox. All rights reserved.
//

import Foundation

//OPZIONI
let opz0 = Opzione(parola: "nonostante", esercizi: [9]) // frase9, es9
let opz1 = Opzione(parola: "infatti", esercizi: [8]) //
let opz2 = Opzione(parola: "dunque", esercizi: [7]) //
let opz3 = Opzione(parola: "anzitutto", esercizi: [6]) //
let opz4 = Opzione(parola: "tuttavia", esercizi: [5]) //
let opz5 = Opzione(parola: "ovunque", esercizi: [4]) //
let opz6 = Opzione(parola: "affinchè", esercizi: [3]) //
let opz7 = Opzione(parola: "invece", esercizi: [2]) //
let opz8 = Opzione(parola: "perciò", esercizi: [1]) //
let opz9 = Opzione(parola: "mentre", esercizi: [0]) //


var opzioni = [opz0, opz1, opz2, opz3, opz4, opz5, opz6, opz7, opz8, opz9]


let frase0 = "[...] uno parlava, l'altro rideva"
let frase1 = "Non ho trovato Davide, [...] non ho potuto dirglielo"
let frase2 = "Qui sta nevicando, in California [...] c'è un sole che spacca le pietre"
let frase3 = "Si deve fare di tutto [...] il diritto alla Privacy venga considerato"
let frase4 = "Ti raggiungerò [...] tu sia"
let frase5 = "Non te lo meriti, [...] ti aiuterò"
let frase6 = "[...] vorrei congratularmi con voi per la vostra cordialità. Poi vorrei salutare vostro zio"
let frase7 = "\"Penso, [...] sono.\""
let frase8 = "[...] non è arrivato. Avevi proprio ragione."
let frase9 = "[...] glielo avessi detto, non ha portato i soldi."


let es0 = Esercizio(fraseRaw: frase0, opzioni: opzioni, id: 0)
let es1 = Esercizio(fraseRaw: frase1, opzioni: opzioni, id: 1)
let es2 = Esercizio(fraseRaw: frase2, opzioni: opzioni, id: 2)
let es3 = Esercizio(fraseRaw: frase3, opzioni: opzioni, id: 3)
let es4 = Esercizio(fraseRaw: frase4, opzioni: opzioni, id: 4)
let es5 = Esercizio(fraseRaw: frase5, opzioni: opzioni, id: 5)
let es6 = Esercizio(fraseRaw: frase6, opzioni: opzioni, id: 6)
let es7 = Esercizio(fraseRaw: frase7, opzioni: opzioni, id: 7)
let es8 = Esercizio(fraseRaw: frase8, opzioni: opzioni, id: 8)
let es9 = Esercizio(fraseRaw: frase9, opzioni: opzioni, id: 9)


let esercizi = [es0, es1, es2, es3, es4, es5, es6, es7, es8, es9]
