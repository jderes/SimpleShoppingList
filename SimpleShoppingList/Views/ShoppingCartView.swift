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
    @State var isFormPresented = false
    
    var body: some View {
        List() {
            ForEach(cart.items) {item in
                ItemRow(item: item)
                }.onDelete(perform: delete)
            }
            .navigationBarTitle(Text(cart.name))
            .navigationBarItems(trailing:
                Image(systemName: "plus.circle")
                    .sheet(isPresented: $isFormPresented, content: {
                        AddItemView(didAdd: self.didAdd(item:))
                    })
                    .font(.title)
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
