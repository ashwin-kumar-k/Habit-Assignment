//
//  HomeViewModel.swift
//  Habit-Assignment
//
//  Created by Ashwin Kumar on 21/04/25.
//

import Foundation

// ViewModel for loading and managing menu data
struct MenuResponse: Codable {
    let triedTastedLoved: [Dish]
    let lookingForMore: [Dish]
}

class HomeViewModel: ObservableObject {
    @Published var tried: [Dish] = []
    @Published var more: [Dish] = []
    
    init() {
        loadMenu()
    }
    
    func loadMenu() {
        // Load and decode menu data from local JSON file
        if let url = Bundle.main.url(forResource: "menu", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoded = try JSONDecoder().decode(MenuResponse.self, from: data)
                tried = decoded.triedTastedLoved
                more = decoded.lookingForMore
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
    }
}
