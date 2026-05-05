//
//  TipsSlide.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct TipsSlide: View {
	let tips : TipsInfo

	var body: some View {
		ZStack {
			Image("tips-background")
				.resizable()
				.ignoresSafeArea()
			VStack(spacing: 30) {
				Spacer(minLength: 0)
				TabView {
					TipsSlideCard(info: tips.look)
						.padding(.horizontal, 40)
					TipsSlideCard(info: tips.cause)
						.padding(.horizontal, 40)
					TipsSlideCard(info: tips.result)
						.padding(.horizontal, 40)
					TipsSlideCard(info: tips.fix)
						.padding(.horizontal, 40)
				}
				.tabViewStyle(.page)
				.indexViewStyle(.page(backgroundDisplayMode: .always))
				.navigationTitle("Tips")
				.navigationSubtitle(tips.title)
				.navigationBarTitleDisplayMode(.inline)
			}
		}
	}
}

#Preview {
	NavigationStack{
		TipsSlide(tips: tips_runny_batter)
	}
}
