//
//  ContentView.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ItemCarousel(items: sampleItems)
            .padding(.top, 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
