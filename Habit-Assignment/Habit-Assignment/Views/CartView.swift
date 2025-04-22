//
//  CartView.swift
//  Habit-Assignment
//
//  Created by Ashwin Kumar on 21/04/25.
//
import SwiftUI

struct CartView: View {
    @ObservedObject var cartVM: CartViewModel
    
    var body: some View {
        VStack {
            if cartVM.cartItems.isEmpty {
                // Show empty cart message
                Spacer()
                Text("Your cart is empty 🍽️")
                    .font(.title2)
                    .foregroundColor(.gray)
                Spacer()
            } else {
                // List of items in the cart
                List {
                    ForEach(Array(cartVM.cartItems.keys), id: \.id) { dish in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(dish.name)
                                    .font(.headline)
                                if let quantity = cartVM.cartItems[dish] {
                                    Text("₹\(dish.price) x \(quantity)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Spacer()
                            
                            if let quantity = cartVM.cartItems[dish] {
                                // Show total price for each dish
                                Text("₹\(dish.price * quantity)")
                                    .fontWeight(.semibold)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
                
                Divider()
                
                // Total Amount Section
                HStack {
                    Text("Total:")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Text("₹\(cartVM.totalAmount())")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
                
                // Pay button (no action for now)
                Button(action: {
                    
                }) {
                    Text("Pay")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
        .navigationTitle("Your Cart")
    }
}

