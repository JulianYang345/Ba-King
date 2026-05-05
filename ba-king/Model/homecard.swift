import SwiftUI

// The Data model dest
enum RecipeDestination{
	case Sponge
	case ComingSoon
}

struct RecipeCategory: Identifiable {
		let id = UUID()
		let title: String
		let subtitle: String
		let imageName: String
		let destination: RecipeDestination
}

//Data feeder
enum RecipeData {
		static let recipeCategories: [RecipeCategory] = [
				RecipeCategory(
						title: "Sponge\nCake",
						subtitle: "Swiss Roll, Victoria Sponge Cake,\nTres Leches Cake Lamingtons, ...",
						imageName: "Sponge",
						destination: .Sponge
				),
				RecipeCategory(
						title: "Pastry\nDough",
						subtitle: "Croissants, Danishes, Puff Pastry,\nChoux, ...",
						imageName: "Pastry",
						destination: .ComingSoon
				),
				RecipeCategory(
						title: "Artisan\nBread",
						subtitle: "Sourdough, Baguettes, Focaccia,\nCiabatta, ...",
						imageName: "Artisan",
						destination: .ComingSoon
				)
		]
}
