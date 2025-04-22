//
//  DishCardSmall.swift
//  Habit-Assignment
//
//  Created by Ashwin Kumar on 22/04/25.
//

import SwiftUI

struct DishCardSmall: View {
    let dish: Dish
    @EnvironmentObject var cartVM: CartViewModel
    
    // Current quantity of this dish in the cart
    var count: Int {
        cartVM.cartItems[dish] ?? 0
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Dish image
            Image(dish.image)
                .resizable()
                .frame(width: 190, height: 200)
                .scaledToFill()
            
            VStack {
                // Dish name
                Text(dish.name)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(7)
                    .font(.headline)
                
                HStack {
                    // Dish price
                    Text("₹\(dish.price)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                        .bold()
                    
                    if count == 0 {
                        // Show "ADD" button if dish not in cart
                        Button {
                            cartVM.addToCart(dish)
                        } label: {
                            Text("ADD")
                                .frame(width: 90, height: 30)
                                .foregroundStyle(.white)
                                .background(.purple)
                                .font(.headline)
                                .cornerRadius(10)
                        }
                    } else {
                        // Show stepper (− / count / +) if dish is in cart
                        HStack {
                            Button {
                                cartVM.removeFromCart(dish)
                            } label: {
                                Image(systemName: "minus")
                            }
                            Text("\(count)")
                                .frame(minWidth: 30)
                            Button {
                                cartVM.addToCart(dish)
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                        .frame(width: 90, height: 30)
                        .foregroundStyle(.white)
                        .background(.purple)
                        .font(.headline)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 7)
                .frame(width: 190)
                .padding(.bottom)
            }
            .padding(.top)
            .frame(width: 190, height: 100)
            .background(.purple.opacity(0.15))
        }
        .clipShape(.rect(cornerRadius: 10))
    }
}
