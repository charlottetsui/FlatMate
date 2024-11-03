//
//  RoomieGroup.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//

import SwiftUI

struct RoomieGroup {
    var roomies: [Roomie]
    var bills: [Bill]
    
    // Total amount due across all bills
    var totalAmountDue: Double {
       let total = bills.reduce(0) {$0 + $1.balance}
        return Double(total)
    }
    
    // Array of balances owed by each individual roommate
    var roommateBalances: [Double] {
        var bals: [Double] = Array(repeating: 0.0, count: roomies.count)
        for i in 0..<(roomies.count){ // Loop over roommates
            var roommateBal = 0.0
            for bill in bills {
                roommateBal += bill.balanceBreakdown[i]
            }
            bals[i] = roommateBal
        }
        return bals
    }
    
    // Example use for testing
    static var flat: RoomieGroup = RoomieGroup(roomies: [Roomie(name: "Lizzie", index: 0),
                                                  Roomie(name: "Charlotte", index: 1),
                                                  Roomie(name: "Caitlin", index: 2),
                                                  Roomie(name: "Caroline", index: 3)],
                                        bills: [Bill(name: "Electricity", balance: 300, balanceBreakdown: [75, 75, 75, 75]),
                                                Bill(name: "Trash", balance: 50, balanceBreakdown: [12.50, 12.50, 12.50, 12.50]),
                                                Bill(name: "Water", balance: 100, balanceBreakdown: [25, 25, 25, 25]),
                                                Bill(name: "Recycling", balance: 25, balanceBreakdown: [6.25, 6.25, 6.25, 6.25])])
}
