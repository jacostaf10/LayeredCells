//
//  ItemCarousel.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct AsyncItemCarousel: View {
    @Namespace var namespace
    let pokemons = loadPokemons()
    @State var selectedPokemon: Pokemon?
    
    var body: some View {
        if selectedPokemon != nil {
            AsyncItemDetailView(namespace: namespace, pokemon: $selectedPokemon)
        } else {
            ScrollView {
                LazyVStack {
                    ForEach(pokemons) {pokemon in
                        AsyncItemCardView(namespace: namespace, pokemon: pokemon)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                                    selectedPokemon = pokemon
                                }
                            }
                    }
                }
            }
            
        }
    }
}

struct AsyncItemCarousel_Previews: PreviewProvider {
    static var previews: some View {
        AsyncItemCarousel()
    }
}
