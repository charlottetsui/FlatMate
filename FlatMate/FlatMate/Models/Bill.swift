//
//  Bill.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//

import Foundation
import SwiftUI

struct Bill {
    var name: String
    var amount: Float
    var payer: Roomie
    var paid: Bool = false
    
    static var power: Bill = Bill(name: "Electricity", amount: 300, payer: Roomie.roomie1)
    static var trash: Bill = Bill(name: "Trash", amount: 50, payer: Roomie.roomie2)
    static var water: Bill = Bill(name: "Water", amount: 100, payer: Roomie.roomie3)
    static var recycling: Bill = Bill(name: "Reycling", amount: 25, payer: Roomie.roomie4)
    
}
