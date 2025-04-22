//
//  CartViewModel.swift
//  Habit-Assignment
//
//  Created by Ashwin Kumar on 21/04/25.
//

import Foundation

// ViewModel to manage cart operations and state
class CartViewModel: ObservableObject {
    @Published var cartItems: [Dish: Int] = [:]
    
    // Add a dish to the cart
    func addToCart(_ dish: Dish) {
        cartItems[dish, default: 0] += 1
    }
    
    // Remove a dish or decrease its quantity from the cart
    func removeFromCart(_ dish: Dish) {
        if let count = cartItems[dish], count > 1 {
            cartItems[dish] = count - 1
        } else {
            cartItems.removeValue(forKey: dish)
        }
    }
    
    // Calculate total payable amount
    func totalAmount() -> Int {
        cartItems.reduce(0) { $0 + $1.key.price * $1.value }
    }
    
    // Get total number of items in the cart
    var totalItemsCount: Int {
        cartItems.values.reduce(0, +)
    }
}
