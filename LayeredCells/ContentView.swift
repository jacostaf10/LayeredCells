//
//  ContentView.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ItemCarousel(items: sampleItems)
                .padding(.top, 25)
                .tabItem {
                    Label("Sync", systemImage: "arrow.down")
                }
            AsyncItemCarousel()
                .padding(.top, 25)
                .tabItem {
                    Label("Async", systemImage: "arrow.up.arrow.down")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
