//
//  RatingView.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: size.width * (rating / 5))
                Rectangle()
                    .fill(Color(.systemGray3))
            }
            .mask {
                HStack {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }.frame(width: size.width, height: size.height)
            }
            
        }.frame(height: 100)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: Item.test.rating)
    }
}
