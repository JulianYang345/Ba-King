//
//  TipsCard.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct TipsCard: View {
	var body: some View {
		HStack(spacing: 10) {
			Color.gray
				.frame(width: 90, height: 120)
				.clipShape(RoundedRectangle(cornerRadius: 20))
			VStack(alignment: .leading, spacing: 8) {
				Text("Runny Batter")
					.font(.system(size: 18, weight: .bold))
				Text("It looks like heavy cream or thin pancake batter. When you lift a whisk, it streams down instantly without leaving a trail (ribbon) on the surface, appearing shiny and liquid.")
					.font(.system(size: 12))
			}
			Image(systemName: "chevron.right")
				.font(.system(size: 12, weight: .semibold))
		}
	}
}

#Preview {
	TipsCard()
		.padding(20)
}
