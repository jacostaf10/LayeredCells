//
//  ItemCardView.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct AsyncItemCardView: View {
    let namespace: Namespace.ID
    let pokemon: Pokemon
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let rect = proxy.frame(in: .global)
            
            HStack(spacing: -25) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(pokemon.name)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .matchedGeometryEffect(id: "name \(pokemon.id)", in: namespace)
                    Text(pokemon.types)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.leading, 5)
                        .matchedGeometryEffect(id: "types \(pokemon.id)", in: namespace)
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }.padding(.horizontal)
                }
                .padding(.vertical, 20)
                .padding(5)
                .frame(width: size.width / 2, height: size.height * 0.8)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                }
                .zIndex(1)
                
                ZStack {
                    
                    AsyncImage(url: pokemon.imageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .background {
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                            }
                            .frame(width: size.width / 2, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 8, x: 5, y: 5)
                            .shadow(color: .black.opacity(0.1), radius: 8, x: -5, y: -5)
                            .matchedGeometryEffect(id: "cover \(pokemon.id)", in: namespace)
                    } placeholder: {
                        Image(systemName: "paperclip")
                            .resizable()
                            .scaledToFit()
                            .background {
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                            }
                            .frame(width: size.width / 2, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 8, x: 5, y: 5)
                            .shadow(color: .black.opacity(0.1), radius: 8, x: -5, y: -5)
                            .matchedGeometryEffect(id: "cover \(pokemon.id)", in: namespace)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: size.width)
            .rotation3DEffect(.degrees(offsetToRotation(rect)), axis: (x: 1, y: 0, z: 0), anchor: .center, anchorZ: 1, perspective: 0.5)
        }
        .frame(height: 200)
        .padding(8)
        
    }
    
    
    func offsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height
        let minY = rect.minY - 100
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90
    }
}

struct AsyncItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncItemCardView(namespace: Namespace().wrappedValue, pokemon: .test)
    }
}
