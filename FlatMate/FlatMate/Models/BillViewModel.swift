//
//  BillViewModel.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//


import SwiftUI

func addBill(name: String, balance: Double, numRoommates: Int) -> Bill{
    let splitBalance: Double = balance / Double(numRoommates)
    let balanceBreakdown = Array(repeating: splitBalance, count: numRoommates)
    
    let newBill: Bill = Bill(name: name, balance: balance, balanceBreakdown: balanceBreakdown)
    
    return newBill
}


