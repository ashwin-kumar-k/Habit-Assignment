# 🍽️ Food Ordering App (SwiftUI)

This is a take-home assignment project that demonstrates a basic food ordering app built using **SwiftUI** and **MVVM architecture**. It features a **Home Screen** with two sections of dish listings (horizontal and vertical) and a **Cart Page** to display selected dishes. The app uses local JSON for menu data and supports in-memory cart state management.

---

## 🚀 Features Implemented

### Home Screen
- "Tried, Tasted, and Loved" section implemented as a **horizontal scrollable list**.
- "Looking for even more" section implemented as a **vertically scrollable list**.
- Each dish has an **"Add"** button to add to cart.
- Cart icon on the top-right navigates to the Cart Page.

### Cart Page
- Lists all items added to the cart.
- Displays **quantity** of each item and the **total price**.
- "Pay" button present at the bottom (for UI purposes only).

### Data Handling
- Local JSON file (`menu.json`) used for dish data.
- JSON includes `id`, `name`, `description`, `price`, and `image` fields.
- Assets for dishes should be added to the project's `Assets.xcassets` folder matching the image names.

### Architecture
- Implemented using **MVVM pattern**.
- `Dish`: Model representing dish data.
- `HomeViewModel`: Handles loading and exposing the menu data.
- `CartViewModel`: Handles all cart operations (add, remove, total calculation).

### SwiftUI State Management
- Used `@StateObject`, `@ObservedObject`, and `@Published` to maintain reactive state for cart and data updates.

---

## 🛠️ Tech Stack
- Swift 5+
- SwiftUI (latest stable)
- MVVM Architecture
- Codable for JSON Parsing

---

## 📂 Project Structure
```
├── Models
│   └── Dish.swift
├── ViewModels
│   ├── HomeViewModel.swift
│   └── CartViewModel.swift
├── Views
│   ├── HomeView.swift
│   ├── DishCardView.swift
│   └── CartView.swift
├── menu.json
├── Assets.xcassets
```

---

## 📦 How to Run
1. Clone this repository.
2. Open the `.xcodeproj` file in the latest version of **Xcode**.
3. Build and run on a simulator or a physical device.

Make sure the image names in the JSON match the assets added in the project.

---

## 📝 Assumptions / Notes
- The UI is intentionally **basic and minimal** due to **time constraints**. If a **Figma file** or design guide had been provided and given more time, I could have closely replicated the intended design with more attention to visual details and polish.
- The focus was placed on **functionality, architecture (MVVM), and clean data handling** rather than detailed UI animations or advanced layout customizations.
- The "Pay" button is a **UI placeholder only**—no real payment logic or integration has been implemented, as it was outside the assignment scope.
- The **cart badge** reflects the total number of items (not total quantity of each unique item). This can be adjusted based on future UI/UX specifications.
- The cart supports **multiple quantities** of the same item.
- The image assets used are assumed to be present in the `Assets.xcassets` folder, named exactly as per the `image` field in the JSON file.
- It was assumed that **local JSON** parsing was sufficient for this demo, and no backend or remote API interaction was required.

---

## 📤 Submission
- All requirements as per the assignment have been implemented.
- Repository contains all relevant files including source code and JSON.
- Any missing polish or visual details are due to the 24-hour time constraint.

---

## ✅ Completed Checklist
- [x] Horizontal and vertical lists rendered correctly
- [x] Local JSON parsing and model mapping
- [x] Add to cart functionality
- [x] Cart state management with total price calculation
- [x] Pay button on Cart Page
- [x] MVVM structure with clean SwiftUI implementation

---

Thanks for reviewing the project!
