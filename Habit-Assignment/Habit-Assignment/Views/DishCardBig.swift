//
//  DishCardBig.swift
//  Habit-Assignment
//
//  Created by Ashwin Kumar on 22/04/25.
//

import SwiftUI

struct DishCardBig: View {
    let dish: Dish
    @EnvironmentObject var cartVM: CartViewModel
    
    // Current quantity of this dish in the cart
    var count: Int {
        cartVM.cartItems[dish] ?? 0
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(dish.name)
                    .lineLimit(2)
                    .font(.title3).bold()
                
                Text(dish.description)
                    .font(.footnote)
                
                Text("₹\(dish.price)")
                    .font(.headline)
            }
            
            Spacer()
            
            ZStack {
                // Dish image
                Image(dish.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(.rect(cornerRadius: 10))
                
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
                    .offset(y: 75)
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
                    .offset(y: 75)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .padding(.horizontal)
        .padding(.bottom)
    }
}

