//
//  ItemModel.swift
//  LayeredCells
//
//  Created by Jorge Acosta Freire on 16/4/23.
//

import SwiftUI

struct Item: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let image: String
    let author: String
    let rating: Double
}


