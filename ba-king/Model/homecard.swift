import SwiftUI

// The Data Model
struct RecipeCategory: Identifiable {
		let id = UUID()
		let title: String
		let subtitle: String
		let imageName: String
}

//Data feeder
enum RecipeData {
		static let recipeCategories: [RecipeCategory] = [
				RecipeCategory(
						title: "Sponge\nCake",
						subtitle: "Swiss Roll, Victoria Sponge Cake,\nTres Leches Cake Lamingtons, ...",
						imageName: "Sponge"
				),
				RecipeCategory(
						title: "Pastry\nDough",
						subtitle: "Croissants, Danishes, Puff Pastry,\nChoux, ...",
						imageName: "Pastry"
				),
				RecipeCategory(
						title: "Artisan\nBread",
						subtitle: "Sourdough, Baguettes, Focaccia,\nCiabatta, ...",
						imageName: "Artisan"
				)
		]
}
