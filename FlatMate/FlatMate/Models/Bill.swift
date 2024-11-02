//
//  Bill.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//

import Foundation
import SwiftUI

struct Bill: Identifiable {
    var id = UUID()
    var name: String
    var amount: Float
    var paid: Bool = false
    
    // Example usage for testing
    static var power: Bill = Bill(name: "Electricity", amount: 300)
    static var trash: Bill = Bill(name: "Trash", amount: 50)
    static var water: Bill = Bill(name: "Water", amount: 100)
    static var recycling: Bill = Bill(name: "Recycling", amount: 25)
    
}
