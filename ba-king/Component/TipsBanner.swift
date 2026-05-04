//
//  TipsBanner.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct TipsBanner: View {
	var body: some View {
		ZStack {
			Color.orange
			Image("TipsBannerIcon")
				.renderingMode(.template)
				.foregroundColor(.white)
			VStack(alignment: .leading, spacing: 8) {
				Spacer()
				Text("Tips")
					.font(.system(size: 24, weight: .heavy))
					.foregroundColor(.white)
				Text("Find ways to fix your dough consistency.")
					.font(.system(size: 20))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 30)
			.padding(.vertical, 40)
		}
	}
}

#Preview {
	TipsBanner()
}
