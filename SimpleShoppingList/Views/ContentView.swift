//
//  ContentView.swift
//  SimpleShoppingList
//
//  Created by Jarek Dereszowski on 24/06/2019.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import Combine
import SwiftUI

struct ContentView : View {
    @ObjectBinding var dataStore = DataStore()
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.carts) { cart in
                    NavigationLink(destination: ShoppingCartView(cart: cart)) {
                        ShopingCartRow(cart: cart)
                    }
                }
                .navigationBarTitle(Text("Shopping carts"))
//                .navigationBarItems(trailing:
//                    PresentationButton(destination: AddItemView(didAdd: didAdd(item:)), label: {
//                        Image(systemName: "plus.circle")
//                            .font(.title)
//                    })
//                )
            }
        }
    }
    
    func didAdd(item: ShoppingCart) {
        
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            dataStore.carts.remove(at: first)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
