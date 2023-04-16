//
//  ItemCardView.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct ItemCardView: View {
    let namespace: Namespace.ID
    let item: Item
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let rect = proxy.frame(in: .global)
            
            HStack(spacing: -25) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .matchedGeometryEffect(id: "title \(item.id)", in: namespace)
                    Text(item.author)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.leading, 5)
                        .matchedGeometryEffect(id: "author \(item.id)", in: namespace)
                    RatingView(rating: item.rating)
                        .scaleEffect(0.7)
                        .frame(height: 30)
                        .padding(.vertical, 10)
                        .matchedGeometryEffect(id: "rating \(item.id)", in: namespace)
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
                    Image(item.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width / 2, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.1), radius: 8, x: -5, y: -5)
                        .matchedGeometryEffect(id: "cover \(item.id)", in: namespace)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: size.width)
            .rotation3DEffect(.degrees(offsetToRotation(rect)), axis: (x: 1, y: 0, z: 0), anchor: .center, anchorZ: 1, perspective: 0.5)
        }
        .frame(height: 200)
        .padding(8)
        //.matchedGeometryEffect(id: item.id, in: namespace)
        
    }
    
    
    func offsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height
        let minY = rect.minY - 100
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90
    }
}

struct ItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCardView(namespace: Namespace().wrappedValue, item: .test)
    }
}
