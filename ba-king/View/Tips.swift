//
//  Tips.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct Tips: View {
	var body: some View {
		NavigationStack {
			ZStack {
				Image("tips-background")
					.resizable()
					.ignoresSafeArea()
				ScrollView {
					VStack {
						TipsBanner()
							.frame(height: 350)
						VStack(spacing: 10) {
							ForEach(tips_list) { tips in
								NavigationLink(destination: TipsSlide(tips: tips)) {
									TipsCard(tips: tips)
								}
								.buttonStyle(.plain)
								if tips.id != tips_list.last?.id {
									TipsCardDivider()
								}
							}
						}
						.padding(20)
					}
				}
			}
			.ignoresSafeArea(edges: .top)
		}
	}
}

#Preview {
	Tips()
}
