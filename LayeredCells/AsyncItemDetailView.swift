//
//  ItemDetailView.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct AsyncItemDetailView: View {
    let namespace: Namespace.ID
    @Binding var pokemon: Pokemon?
    
    var isSelected: Bool { pokemon != nil }
    
    var body: some View {
        ScrollView {
        VStack(spacing: 15) {
            if let pokemon {
                AsyncImage(url: pokemon.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .cornerRadius(10)
                        .matchedGeometryEffect(id: "cover \(pokemon.id)", in: namespace)
                        .zIndex(1)
                } placeholder: {
                    Image(systemName: "paperclip")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .cornerRadius(10)
                        .matchedGeometryEffect(id: "cover \(pokemon.id)", in: namespace)
                        .zIndex(1)
                }

                    
                Text(pokemon.name)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .matchedGeometryEffect(id: "name \(pokemon.id)", in: namespace)
                Text(pokemon.types)
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: "types \(pokemon.id)", in: namespace)
                
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
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                    pokemon = nil
                }
            } label: {
                Image(systemName: "xmark")
                    .symbolVariant(.fill)
                    .symbolVariant(.circle)
                    .font(.largeTitle)
            }
            .buttonStyle(.plain)
            .foregroundColor(.gray)
            .padding([.top, .trailing])
        }
    }
}

struct AsyncItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncItemDetailView(namespace: Namespace().wrappedValue, pokemon: .constant(.test))
    }
}
