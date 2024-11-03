//
//  Bill.swift
//  FlatMate
//
//  Created by Lizzie Coats on 11/2/24.
//

import Foundation
import SwiftUI

struct Bill: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var balance: Double
    
    // Contains balance broken down into portions owed by each roommate
    // Portion indexes correspond to roommate index values
    // For example, balanceBreakdown[0] corresponds to Roommate 0's current balance
    var balanceBreakdown: [Double] = []
    var paid: Bool = false
    
    
}
