//
//  User.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//

import Foundation
import SwiftUI

struct Roomie: Identifiable {
    let id = UUID()
    var name: String
    var amountOwed: Float
    
    
    // Example usage for testing
    static var roomie1: Roomie = Roomie(name: "Lizzie", amountOwed: 0)
    static var roomie2: Roomie = Roomie(name: "Charlotte", amountOwed: 0)
    static var roomie3: Roomie = Roomie(name: "Caitlin", amountOwed: 0)
    static var roomie4: Roomie = Roomie(name: "Caroline", amountOwed: 0)
}
