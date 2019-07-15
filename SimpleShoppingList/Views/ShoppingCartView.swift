//
//  ShoppingCartView.swift
//  SimpleShoppingList
//
//  Created by Jarek on 6/29/19.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import SwiftUI

struct ShoppingCartView : View {
    @ObjectBinding var cart: ShoppingCart
    
    var body: some View {
        List() {
            ForEach(cart.items) {item in
                ItemRow(item: item)
                }.onDelete(perform: delete)
            }
            .navigationBarTitle(Text(cart.name))
            .navigationBarItems(trailing:
                PresentationLink(destination: AddItemView(didAdd: didAdd(item:)), label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                })
        )
    }
    
    func didAdd(item: Item) {
        cart.items.append(item)
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            cart.items.remove(at: first)
        }
    }
}

#if DEBUG
//struct ShoppingCartView_Previews : PreviewProvider {
//    static var previews: some View {
//        ShoppingCartView()
//    }
//}
#endif
