//
//  userDefaultsInfo.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/28/19.
//  Copyright © 2019 roho. All rights reserved.
//

import Foundation

class UserDefaultsInfo {
    
    static let instance = UserDefaultsInfo()
    let userDefaults = UserDefaults.standard
    
    func saveInfo(){
        userDefaults.set(ContactsInfo.instance.arrayName, forKey: "ArrayName")
        userDefaults.set(ContactsInfo.instance.arrayLastName, forKey: "ArrayLastname")
        userDefaults.set(ContactsInfo.instance.arrayAge, forKey: "ArrayAge")
        userDefaults.set(ContactsInfo.instance.arrayPhone, forKey: "ArrayPhone")
        userDefaults.synchronize()
        assignValues()
    }
    
    func assignValues(){
        ContactsInfo.instance.arrayName = userDefaults.array(forKey: "ArrayName") as! [String]
        ContactsInfo.instance.arrayLastName = userDefaults.array(forKey: "ArrayLastname") as! [String]
        ContactsInfo.instance.arrayAge = userDefaults.array(forKey: "ArrayAge") as! [Int]
        ContactsInfo.instance.arrayPhone = userDefaults.array(forKey: "ArrayPhone") as! [String]
    }
}
