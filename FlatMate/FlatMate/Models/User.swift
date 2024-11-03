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
    var index: Int
    
    
    // Example usage for testing
    static var roomie1: Roomie = Roomie(name: "Lizzie", index: 0)
    static var roomie2: Roomie = Roomie(name: "Charlotte", index: 1)
    static var roomie3: Roomie = Roomie(name: "Caitlin", index: 2)
    static var roomie4: Roomie = Roomie(name: "Caroline", index: 3)
}
