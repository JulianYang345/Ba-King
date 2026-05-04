//
//  TipsInfo.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct Info {
	let image: Image?
	let title: String
	let description: String
}

struct TipsInfo: Identifiable {
	let id = UUID()
	let title: String
	let look: Info
	let cause: Info
	let result: Info
	let fix: Info
}

let tips_list = [
	tips_runny_batter,
	tips_clumpy_batter,
	tips_thick_batter,
	tips_dry_batter
]

let tips_runny_batter = TipsInfo(
	title: "Runny Batter",
	look: Info(
		image: nil,
		title: "The Look",
		description: "It looks like heavy cream or thin pancake batter. When you lift a whisk, it streams down instantly without leaving a trail (ribbon) on the surface, appearing shiny and liquid."
	),
	cause: Info(
		image: nil,
		title: "The Cause",
		description: "Usually caused by over-mixing (which knocks out the air bubbles), using eggs that are too small, or adding too much liquid (like milk or melted butter)."
	),
	result: Info(
		image: nil,
		title: "The Result",
		description: "A dense, rubbery cake that doesn’t rise well because it lacks the structural \"lift\" provided by air."
	),
	fix: Info(
		image: nil,
		title: "The Fix",
		description: "You can’t really \"un-deflate\" a sponge. However, you can try sifting in a tablespoon or two of extra flour to give it some structure, but the cake will likely be dense and rubbery rather than airy."
	)
)

let tips_clumpy_batter = TipsInfo(
	title: "Clumpy Batter",
	look: Info(
		image: nil,
		title: "The Look",
		description: "It looks curdled or \"broken,\" similar to cottage cheese. You’ll see distinct chunks of butter or flour suspended in a thin liquid rather than a smooth, uniform emulsion."
	),
	cause: Info(
		image: nil,
		title: "The Cause",
		description: ""
	),
	result: Info(
		image: nil,
		title: "The Result",
		description: ""
	),
	fix: Info(
		image: nil,
		title: "The Fix",
		description: ""
	)
)

let tips_thick_batter = TipsInfo(
	title: "Thick Batter",
	look: Info(
		image: nil,
		title: "The Look",
		description: "It looks like soft-serve ice cream or Greek yogurt. It holds its shape stubbornly; if you move a spoon through it, the \"path\" remains visible, and it falls off a spatula in heavy, slow globs."
	),
	cause: Info(
		image: nil,
		title: "The Cause",
		description: ""
	),
	result: Info(
		image: nil,
		title: "The Result",
		description: ""
	),
	fix: Info(
		image: nil,
		title: "The Fix",
		description: ""
	)
)

let tips_dry_batter = TipsInfo(
	title: "Dry Batter",
	look: Info(
		image: nil,
		title: "The Look",
		description: "It looks shaggy, dull, and pasty. It resembles thick peanut butter or wet sand,  A pulling away from the sides of the bowl in a stiff ball with visible streaks of unmixed flour."
	),
	cause: Info(
		image: nil,
		title: "The Cause",
		description: ""
	),
	result: Info(
		image: nil,
		title: "The Result",
		description: ""
	),
	fix: Info(
		image: nil,
		title: "The Fix",
		description: ""
	)
)
