//
//  TipsCard.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct TipsCard: View {
	let tips: TipsInfo

	var body: some View {
		HStack(spacing: 10) {
			ImagePlaceholder(image: tips.look.image)
				.frame(width: 90, height: 120)
				.clipShape(RoundedRectangle(cornerRadius: 20))
			VStack(alignment: .leading, spacing: 8) {
				Text(tips.title)
					.font(.system(size: 18, weight: .bold))
				Text(tips.look.description)
					.font(.system(size: 12))
			}
			.frame(maxWidth: .infinity)
			Image(systemName: "chevron.right")
				.font(.system(size: 12, weight: .semibold))
		}
	}
}

#Preview {
	TipsCard(tips: tips_runny_batter)
		.padding(20)
}
