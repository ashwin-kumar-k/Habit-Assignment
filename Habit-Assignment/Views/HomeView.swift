ScrollView(.horizontal, showsIndicators: false) {
    LazyHStack(spacing: 20){
        ForEach(homeVM.tried) { dish in
            DishCardSmall(dish: dish)
        }
    }
}

VStack(spacing: 16) {
    ForEach(homeVM.more) { dish in
        DishCardBig(dish: dish)
    }
}

NavigationLink(destination: CartView(cartVM: cartVM)) {
    // Cart icon with item count
} 