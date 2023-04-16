//
//  ItemCarousel.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct ItemCarousel: View {
    @Namespace var namespace
    let items: [Item]
    @State var selectedItem: Item?
    
    var body: some View {
        if selectedItem != nil {
            ItemDetailView(namespace: namespace, item: $selectedItem)
        } else {
            ScrollView {
                LazyVStack {
                    ForEach(items) {item in
                        ItemCardView(namespace: namespace, item: item)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    selectedItem = item
                                }
                            }
                    }
                }
            }
            
        }
    }
}

struct ItemCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ItemCarousel(items: sampleItems)
    }
}
