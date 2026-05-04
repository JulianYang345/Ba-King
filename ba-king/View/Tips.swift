//
//  Tips.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct Tips: View {
	var body: some View {
		VStack {
			VStack(spacing: 10) {
				ForEach(tips_list) { tips in
					TipsCard(tips: tips)
					if tips.id != tips_list.last?.id {
						TipsCardDivider()
					}
				}
			}
			.padding(20)
		}
	}
}

#Preview {
	Tips()
}
