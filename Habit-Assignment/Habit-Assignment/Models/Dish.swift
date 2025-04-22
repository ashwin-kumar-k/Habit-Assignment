//
//  Dish.swift
//  Habit-Assignment
//
//  Created by Ashwin Kumar on 21/04/25.
//

import Foundation

// Basic model for a dish item
struct Dish: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let description: String
    let price: Int
    let image: String
}
