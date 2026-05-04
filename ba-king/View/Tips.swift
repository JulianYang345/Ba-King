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
				TipsCard()
				TipsCardDivider()
				TipsCard()
				TipsCardDivider()
				TipsCard()
				TipsCardDivider()
				TipsCard()
			}
		}
	}
}

#Preview {
	Tips()
}
