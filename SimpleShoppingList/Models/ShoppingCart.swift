//
//  ShoppingCart.swift
//  SimpleShoppingList
//
//  Created by Jarek on 6/29/19.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import SwiftUI
import Combine

class ShoppingCart: Identifiable, Codable, BindableObject {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case date = "date"
        case items = "items"
    }
    
    var id = UUID()
    var willChange = PassthroughSubject<Void, Never>()
    
    var name: String
    var date: Date
    var items = [Item]() { willSet { willChange.send() } }
    var numberOfItems: Int {
        return items.count
    }
}
