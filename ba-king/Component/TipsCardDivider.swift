//
//  TipsCardDivider.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct TipsCardDivider: View {
	var body: some View {
		HStack(spacing: 10) {
			Spacer()
				.frame(width: 90)
			VStack{
				Divider()
			}
		}
	}
}

#Preview {
	TipsCardDivider()
		.padding(20)
}
