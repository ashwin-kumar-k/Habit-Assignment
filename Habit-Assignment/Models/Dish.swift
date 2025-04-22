struct Dish: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let image: String
    let category: String
} 