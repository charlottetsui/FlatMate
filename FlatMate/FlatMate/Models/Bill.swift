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
    var balanceBreakdown: [Double] = []
    var paid: Bool = false
    
    
}
