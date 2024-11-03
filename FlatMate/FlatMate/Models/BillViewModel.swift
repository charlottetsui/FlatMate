//
//  BillViewModel.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//


import SwiftUI

class BillViewModel: ObservableObject {
    /**
     * Adds a new bill to the list. By default, the bill is split evenly between all roommates.
    */
    func addExpense(@Binding bills: [Bill], name: String, balance: Double, numRoommates: Int){
        let splitBalance: Double = balance / Double(numRoommates)
        let balanceBreakdown = Array(repeating: splitBalance, count: numRoommates)
        let newBill: Bill = Bill(name: name, balance: balance, balanceBreakdown: balanceBreakdown)
        bills.append(newBill)
    }
    
    /**
     * Adds a new payment to the current user's account. Adjusts total balance and user balance.
    */
    func makePayment(@Binding flat: RoomieGroup, @Binding bill: Bill, amount: Double, userIndex: Int){
        var userBalance: Double = bill.balanceBreakdown[userIndex] 
        
        var billFound: Bool = false // flag if bill exists
        var editingBill = flat.bills[0] // bill object to mutate, which will eventually be updated in the $flat struct
        var billIndex = 0 // default value
        
        // find the bill to modify
        for i in 0..<flat.bills.count{
            if flat.bills[i].name == bill.name {
                billFound = true
                editingBill = flat.bills[i]
                billIndex = i
                break
            }
        }
        
        // if the bill exists, update its value
        if (billFound == true){
            // Bill is already fully paid
            if (userBalance <= 0){
                editingBill.paid = true
                flat.bills[billIndex] = editingBill
                return
            }
            
            // User is trying to pay more than they owe
            if (userBalance < amount){
                editingBill.balanceBreakdown[userIndex] = 0.0
                editingBill.balance -= userBalance
                flat.bills[billIndex] = editingBill
                return
            }
            
            // Regular use case
            editingBill.balance = editingBill.balance - amount
            editingBill.balanceBreakdown[userIndex] = (userBalance - amount)
            flat.bills[billIndex] = editingBill
            
        }
    }
}


