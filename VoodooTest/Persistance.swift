//
//  Persistance.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation

class Persistance {
    
    static func getInitialAddress() -> String {
        return "0x2a2DE8013BF6bf725235af5F77820F67cdA4140A"
    }
    
    static func getCurrentAddress() -> String? {
        return UserDefaults.standard.string(forKey: "currentAddress")
    }
    
    static func saveCurrentAddress(address: String) {
        UserDefaults.standard.set(address, forKey: "currentAddress")
    }
}
