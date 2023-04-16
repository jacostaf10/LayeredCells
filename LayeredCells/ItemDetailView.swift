//
//  ItemDetailView.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct ItemDetailView: View {
    let namespace: Namespace.ID
    @Binding var item: Item?
    
    var isSelected: Bool { item != nil }
    
    var body: some View {
        ScrollView {
        VStack(spacing: 15) {
            if let item {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "cover \(item.id)", in: namespace)
                    .zIndex(1)
                Text(item.title)
                    .font(.largeTitle)
                    .bold()
                    .matchedGeometryEffect(id: "title \(item.id)", in: namespace)
                Text("By \(item.author)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: "author \(item.id)", in: namespace)
                RatingView(rating: item.rating)
                    
                    .scaleEffect(0.5)
                    .frame(height: 100)
                    .matchedGeometryEffect(id: "rating \(item.id)", in: namespace)
                
                Text("""
                    Lorem ipsum dolor sit amet. In aspernatur error vel quidem voluptas et explicabo sint. Aut omnis consequatur rem accusamus facilis cum Quis neque est aliquam consequuntur eos voluptate atque. Non accusamus eius cum labore laboriosam ad voluptatem possimus ab porro libero aut voluptatem cupiditate. Eos dolor odit nam placeat repellat ea dolores ipsum est laborum soluta qui eius totam quo voluptas nihil in earum voluptas.
                    
                    Ut delectus harum id voluptatibus voluptatem et reprehenderit aperiam ut praesentium distinctio aut facilis dolores ut animi neque? Sit molestiae quis sit tempore quibusdam quo labore corrupti ea galisum praesentium qui amet dolorem. Sed perferendis eaque qui atque omnis 33 autem sapiente.
                    
                    Qui veritatis nobis sed dignissimos eius vel quidem cupiditate. Est voluptatem commodi ut fugit sunt qui quam porro.
                    """)
                .font(.callout)
                .padding()
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
        .overlay(alignment: .topTrailing) {
            Button {
                withAnimation(.spring()){
                    item = nil
                }
            } label: {
                Image(systemName: "xmark")
                    .symbolVariant(.fill)
                    .symbolVariant(.circle)
                    .font(.largeTitle)
            }
            .buttonStyle(.plain)
            .foregroundColor(.white.opacity(0.8))
            .padding([.top, .trailing])
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(namespace: Namespace().wrappedValue, item: .constant(.test))
    }
}
