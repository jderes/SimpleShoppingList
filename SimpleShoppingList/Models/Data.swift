//
//  Data.swift
//  SimpleShoppingList
//
//  Created by Jarek on 6/29/19.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import Combine
import SwiftUI

class DataStore: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var carts = [ShoppingCart]() { didSet { didChange.send() } }
    
    init() {
        self.carts = load("data.json")
    }
}

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
