//
//  Item.swift
//  SimpleShoppingList
//
//  Created by Jarek Dereszowski on 24/06/2019.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import SwiftUI
import Combine

struct Item: Identifiable, Codable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case quantity = "quantity"
    }
    
    var id = UUID()
    
    var name: String
    var quantity: Int
    var done: Bool = false
}
