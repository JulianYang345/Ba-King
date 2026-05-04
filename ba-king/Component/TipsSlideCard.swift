//
//  TipsSlideCard.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct TipsSlideCard: View {
	let info : Info

	var body: some View {
		VStack(spacing: 30) {
			ImagePlaceholder(image: info.image)
				.frame(width: 315, height: 420)
				.clipShape(RoundedRectangle(cornerRadius: 20))
			VStack(alignment: .leading, spacing: 10) {
				Text(info.title)
					.font(.system(size: 22, weight: .semibold))
				Text(info.description)
					.font(.system(size: 16))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			Spacer()
		}
	}
}

#Preview {
	TipsSlideCard(info: tips_runny_batter.look)
		.padding(20)
}
