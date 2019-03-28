//
//  VerifyConnection.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/27/19.
//  Copyright © 2019 roho. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    
    static let instance = Connectivity()
    
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
