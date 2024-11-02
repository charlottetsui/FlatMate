//
//  RoomieGroup.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//

struct RoomieGroup {
    var roomies: [Roomie]
    var bills: [Bill]
    
    var totalAmountDue: Float {
        let total = bills.reduce(0) {$0 + $1.amount}
        return total
    }
    
    var splitAmountDue: Float {
        return totalAmountDue/Float(roomies.count)
    }

    // Example usage for testing
    static var house: RoomieGroup = RoomieGroup(roomies: [Roomie.roomie1, Roomie.roomie2, Roomie.roomie3, Roomie.roomie4], bills: [Bill.power, Bill.water, Bill.trash, Bill.recycling])
}
