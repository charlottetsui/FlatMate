//
//  RoomieGroup.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//

struct RoomieGroup{
    var roomies: [Roomie]
    var bills: [Bill]

    static var house: RoomieGroup = RoomieGroup(roomies: [Roomie.roomie1, Roomie.roomie2, Roomie.roomie3, Roomie.roomie4], bills: [Bill.power, Bill.water, Bill.trash, Bill.recycling])
}
