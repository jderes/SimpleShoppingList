//
//  ShopingCartRow.swift
//  SimpleShoppingList
//
//  Created by Jarek on 6/30/19.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import SwiftUI

struct ShopingCartRow : View {
    @ObjectBinding var cart: ShoppingCart
    var dateFormatter: DateFormatter  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd YYYY"
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(cart.name)
            Text("\(self.dateFormatter.string(from: cart.date)) • \(cart.numberOfItems) item(s)").font(.caption).foregroundColor(.secondary)
        }
    }
}

#if DEBUG
//struct ShopingCartRow_Previews : PreviewProvider {
//    static var previews: some View {
//        ShopingCartRow()
//    }
//}
#endif
