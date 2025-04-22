//
//  ContentView.swift
//  Habit-Assignment
//
//  Created by Ashwin Kumar on 21/04/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel() // ViewModel for fetching and storing menu data
    @StateObject var cartVM = CartViewModel() // ViewModel for cart management
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    
                    // First Section Title
                    Text("Tried, Tasted, and Loved")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    // Horizontal list of small dish cards
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20){
                            ForEach(homeVM.tried) { dish in
                                DishCardSmall(dish: dish)
                                    .environmentObject(cartVM)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    // Second Section Title
                    Text("Looking for even more?")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    // Vertical list of big dish cards
                    VStack(spacing: 16) {
                        ForEach(homeVM.more) { dish in
                            DishCardBig(dish: dish)
                                .environmentObject(cartVM)
                            Divider()
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView(cartVM: cartVM)) {
                        ZStack(alignment: .topTrailing) {
                            // Cart icon
                            Image(systemName: "cart")
                                .font(.title2)
                            
                            // Badge showing item count in cart
                            if cartVM.totalItemsCount > 0 {
                                Text("\(cartVM.totalItemsCount)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.purple)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                            }
                        }
                    }
                }
            }
        }
        .accentColor(.purple) // Set accent color to purple
    }
}

#Preview {
    HomeView()
}
