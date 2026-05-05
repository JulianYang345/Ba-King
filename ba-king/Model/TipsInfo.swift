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
		image: Image("runny-look"),
		title: "The Look",
		description: "The batter will appear very thin and liquid, lacking the airy, voluminous structure typical of a proper sponge. It will easily pour out of the bowl like pancake batter rather than falling in thick ribbons."
	),
	cause: Info(
		image: Image("runny-cause"),
		title: "The Cause",
		description: "This usually happens if the eggs were under-beaten and didn't trap enough air, or if you over-mixed the flour and deflated the egg foam. It can also occur if you accidentally added too much liquid or melted butter."
	),
	result: Info(
		image: Image("runny-result"),
		title: "The Result",
		description: "If baked as is, the cake will likely be dense, rubbery, and very thin because it lacks the internal air bubbles needed to rise. You might also find a tough, \"custardy\" layer at the bottom where the batter settled."
	),
	fix: Info(
		image: Image("runny-fix"),
		title: "The Fix",
		description: "Gently fold in a little more sifted flour to help provide some structure, though you must be careful not to over-work it. Alternatively, you can try whisking a fresh egg white to stiff peaks and very gently folding it in to re-introduce lost air."
	)
)

let tips_clumpy_batter = TipsInfo(
	title: "Clumpy Batter",
	look: Info(
		image: Image("clumpy-look"),
		title: "The Look",
		description: "You will see visible white streaks or small, stubborn balls of dry flour floating throughout the yellow egg mixture. The texture looks uneven and \"lumpy\" rather than smooth and satiny."
	),
	cause: Info(
		image: Image("clumpy-cause"),
		title: "The Cause",
		description: "This is often caused by dumping all the flour in at once instead of sifting it in gradually. It also happens when the flour isn't folded in properly from the bottom of the bowl, leaving pockets of dry ingredients."
	),
	result: Info(
		image: Image("clumpy-result"),
		title: "The Result",
		description: "Your finished cake will have unpleasant \"flour bombs\" or dry, powdery spots inside the crumb. These clumps won't cook through properly, leaving the cake with a poor, inconsistent mouthfeel."
	),
	fix: Info(
		image: Image("clumpy-fix"),
		title: "The Fix",
		description: "Use a large metal spoon or a balloon whisk to gently \"cut\" through the clumps using a figure-eight motion to break them up without deflating the air. If the clumps are large, you can try passing the batter through a coarse sieve, though this risks losing some volume."
	)
)

let tips_thick_batter = TipsInfo(
	title: "Thick Batter",
	look: Info(
		image: Image("thick-look"),
		title: "The Look",
		description: "The batter appears heavy and stiff, resisting movement when you try to fold it. It might look more like a dense cookie dough or a heavy pound cake batter rather than a light, foamy sponge."
	),
	cause: Info(
		image: Image("thick-cause"),
		title: "The Cause",
		description: "This usually stems from using too much flour or using \"Large\" eggs when the recipe called for \"Extra Large,\" leading to an imbalance of dry-to-wet ingredients. It can also happen if the flour was packed too tightly into the measuring cup."
	),
	result: Info(
		image: Image("thick-result"),
		title: "The Result",
		description: "The cake will turn out very dry and heavy, losing the \"springy\" quality that defines a sponge cake. It will likely have a tight, bread-like crumb and won't rise to its full potential height."
	),
	fix: Info(
		image: Image("thick-fix"),
		title: "The Fix",
		description: "Gently fold in a tablespoon of room-temperature milk or water at a time to loosen the consistency. If the recipe allows, adding a small amount of melted (but cooled) butter can also help soften the texture."
	)
)

let tips_dry_batter = TipsInfo(
	title: "Dry Batter",
	look: Info(
		image: Image("dry-look"),
		title: "The Look",
		description: "The mixture looks \"shaggy\" and dull, with parts of the batter appearing almost crumbly. It lacks any sheen or flow, looking more like a paste than a cohesive cake batter."
	),
	cause: Info(
		image: Image("dry-cause"),
		title: "The Cause",
		description: "This is typically caused by extreme over-incorporation of dry ingredients or omitting a key liquid component like egg yolks or oil. It can also occur if the batter sits out too long and the flour absorbs all the moisture from the eggs."
	),
	result: Info(
		image: Image("dry-result"),
		title: "The Result",
		description: "The baked cake will be incredibly crumbly and will likely fall apart the moment you try to slice it. It will feel \"choking\" to eat because it lacks the necessary moisture to create a soft crumb."
	),
	fix: Info(
		image: Image("dry-fix"),
		title: "The Fix",
		description: "Whisk an extra egg with a teaspoon of water and very carefully fold it into the batter to restore moisture. You must be extremely gentle during this process to avoid making the finished cake even tougher."
	)
)

#Preview {
	Tips()
}
