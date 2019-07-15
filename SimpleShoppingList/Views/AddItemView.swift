//
//  AddItemView.swift
//  SimpleShoppingList
//
//  Created by Jarek Dereszowski on 24/06/2019.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import SwiftUI

struct AddItemView : View {
    var didAdd: ((Item) -> ())?
    
    @State private var tempItem = Item(name: "", quantity: 1)
    @Environment(\.isPresented) private var isPresented
    
    init(didAdd: ((Item) -> ())?) {
        self.didAdd = didAdd
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $tempItem.name)
                Stepper(value: $tempItem.quantity, in: 1...10) {
                    Text("Number of items: \(tempItem.quantity)")
                }
                Section() {
                    Button(action: save) {
                        Text("Save")
                    }.disabled(tempItem.name.isEmpty)
                }
            }.navigationBarTitle(Text("Add new item"))
        }
    }
    
    func save() {
        didAdd?(tempItem)
        isPresented?.value = false
    }
}

#if DEBUG
struct AddItemView_Previews : PreviewProvider {
    static var previews: some View {
        AddItemView(didAdd: nil)
    }
}
#endif
