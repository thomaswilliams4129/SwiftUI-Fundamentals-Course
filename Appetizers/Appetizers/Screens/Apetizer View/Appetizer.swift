//
//  Appetizers.swift
//  Appetizers
//
//  Created by Thomas Williams on 7/5/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let descritpion: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protien: Int
    let carbs: Int
}

struct AppetizerResponse {
    let request: [Appetizer]
}

struct MockData {
    static let sampleApetizer = Appetizer(id: 0001,
                                          name: "Test Appetizer",
                                          descritpion: "This is the descritption for my appetizer. It's yummy.",
                                          price: 9.99,
                                          imageURL: "asian-flank-steak",
                                          calories: 99,
                                          protien: 99,
                                          carbs: 99)
    
    static let appetizers = [sampleApetizer, sampleApetizer, sampleApetizer, sampleApetizer]
}
