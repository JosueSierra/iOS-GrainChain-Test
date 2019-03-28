//
//  ContactsInfo.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/28/19.
//  Copyright © 2019 roho. All rights reserved.
//

import Foundation

class ContactsInfo {
    
    static let instance = ContactsInfo()
    var dictContact = [String:[String]]()
    
    var arrayName = ["Josue","Adrian","Tomas","Enrique","Andres","Luis","Lael","Ivan","Jose","Alejandro"]
    var arrayLastName = ["Enriquez","Villanueva","Talamantes","Sigala","Escobedo","Ayala","Hernandez","Chavira","Torres","Gomez"]
    var arrayAge = [21,14,18,56,99,34,50,41,25,29]
    var arrayPhone = ["6141957874","6141874523","6143981234","6141345687","6143996577","6141874523","6143981234","6141345687","6143996577","6142897434"]
    
    func assignDict(){
        for (index,path) in arrayName.enumerated() {
            dictContact[path] = [arrayLastName[index],"\(arrayAge[index])",arrayPhone[index]]
        }
    }
    
}


