//
//  BillViewModel.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//


import SwiftUI

class BillViewModel: ObservableObject {
    
    func addExpense(name: String, balance: Double, numRoommates: Int){
        let splitBalance: Double = balance / Double(numRoommates)
        let balanceBreakdown = Array(repeating: splitBalance, count: numRoommates)
        
        let newBill: Bill = Bill(name: name, balance: balance, balanceBreakdown: balanceBreakdown)
        
        RoomieGroup.flat.bills.append(newBill)
    }
    
    func makePayment(@Binding bill: Bill, amount: Double, userIndex: Int){
        var userBalance: Double = bill.balanceBreakdown[userIndex]
        
        // Bill is already fully paid
        if (userBalance <= 0){
            bill.paid = true
            return
        }
        
        // User is trying to pay more than they owe
        if (userBalance < amount){
            bill.balanceBreakdown[userIndex] = 0.0
            bill.balance -= userBalance
            return
        }
        
        // Regular use case
        bill.balance -= amount
        bill.balanceBreakdown[userIndex] = (userBalance - amount)
    }
}


