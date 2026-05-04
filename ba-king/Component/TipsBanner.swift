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
			LinearGradient(
				stops: [
					.init(color: Color("primary_orange_color"), location: 0.0),
					.init(color: Color("primary_orange_color"), location: 0.64),
					.init(color: .white, location: 1.0)
				],
				startPoint: .top,
				endPoint: .bottom
			)
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
		.frame(height: 350)
}
