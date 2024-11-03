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
    
    // total amount due across all bills
    var totalAmountDue: Double {
       let total = bills.reduce(0) {$0 + $1.balance}
        return Double(total)
    }
    

    // Example usage for testing
    static var house: RoomieGroup = RoomieGroup(roomies: [Roomie.roomie1, Roomie.roomie2, Roomie.roomie3, Roomie.roomie4], bills: [Bill.power, Bill.water, Bill.trash, Bill.recycling])
}
