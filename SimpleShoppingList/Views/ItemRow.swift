//
//  ItemRow.swift
//  SimpleShoppingList
//
//  Created by Jarek Dereszowski on 24/06/2019.
//  Copyright © 2019 Jarek Dereszowski. All rights reserved.
//

import SwiftUI

struct ItemRow : View {
    @State var item: Item
    
    var body: some View {
        Button(action: {
            self.item.done.toggle()
        }) {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.item.name)
                        .font(.headline)
                        .strikethrough(self.item.done)
                        .foregroundColor(self.item.done ? .secondary : .primary)
                    Text("\(self.item.quantity)")
                        .font(.subheadline)
                        .strikethrough(self.item.done)
                        .foregroundColor(self.item.done ? .secondary : .primary)
                }
                Spacer()
                if self.item.done {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.secondary)
                } else {
                    Image(systemName: "circle")
                }
            }
        }
    }
}

#if DEBUG
struct ItemRow_Previews : PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item(name: "example", quantity: 2))
    }
}
#endif
