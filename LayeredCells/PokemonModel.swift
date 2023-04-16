//
//  Model.swift
//  PrimeraAppSwiftUI
//
//  Created by Jorge Acosta Freire on 23/3/23.
//

import Foundation

struct Pokemons: Codable {
    let pokemon: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let type: [String]
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name, type, imageURL
    }
}

extension Pokemon {
    var types: String {
        type.joined(separator: ", ")
    }
}

func loadPokemons() -> [Pokemon] {
    do {
        let data = try Data(contentsOf: Bundle.main.url(forResource: "pokemons", withExtension: "json")!)
        return try JSONDecoder().decode(Pokemons.self, from: data).pokemon
    } catch {
        print(error)
        return []
    }
}
