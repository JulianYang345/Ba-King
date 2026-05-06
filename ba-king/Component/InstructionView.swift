//
//  InstructionView.swift
//  ba-king
//
//  Created by Samuel Jeremy Winoto on 06/05/26.
//

import SwiftUI

struct InstructionView: View {
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		//exit
		ZStack {
			VStack(spacing: 0) {
				Text("NOTICE")
					.font(.system(size: 17, weight: .bold))
					.padding(.bottom, 16)
				
				Image("Tutorial")
					.resizable()
					.scaledToFit()
					.cornerRadius(16)
					.padding(.horizontal, 16)
				
				VStack(alignment: .leading, spacing: 8) {
					Text("BEFORE YOU START")
						.font(.system(size: 18, weight: .bold))
						.foregroundColor(.black)
					
					Text("Please place your phone on a tripod. Ensure that the camera is facing towards your bowl of batter to ensure that our system could detect your dough consistency accurately")
						.font(.system(size: 14))
						.foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
						.lineSpacing(4)
				}
				.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 20).padding(.top, 16)
				Spacer()
			}
			.padding(.top,20)
			.background(Color.white)
			.cornerRadius(20)
			
		}.onTapGesture {
			dismiss()
			}
		.presentationDetents([.medium])
		.presentationDragIndicator(.visible)
		.presentationBackground(.white)
	}
}

#Preview {
    InstructionView()
}
////
////  InstructionView.swift
////  ba-king
////
////  Created by Samuel Jeremy Winoto on 06/05/26.
////
//
//import SwiftUI
//
//struct InstructionView: View {
//	@Environment(\.dismiss) var dismiss
//	
//	var body: some View {
//		//exit
//		ZStack {
//			Color.clear
//				.contentShape(Rectangle())
//				.onTapGesture {
//					dismiss()
//				}
//			VStack(spacing: 0) {
//				
//		
//				Text("NOTICE")
//					.font(.system(size: 17, weight: .bold))
//					.padding(.bottom, 16)
//				
//				Image("Tutorial")
//					.resizable()
//					.scaledToFit()
//					.cornerRadius(16)
//					.padding(.horizontal, 16)
//				
//				VStack(alignment: .leading, spacing: 8) {
//					Text("BEFORE YOU START")
//						.font(.system(size: 18, weight: .bold))
//						.foregroundColor(.black)
//					
//					Text("Please place your phone on a tripod. Ensure that the camera is facing towards your bowl of batter to ensure that our system could detect your dough consistency accurately")
//						.font(.system(size: 14))
//						.foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
//						.lineSpacing(4)
//				}
//				.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 20).padding(.top, 16)
//				Spacer()
//			}.padding(.top,20)
//			.background(Color.white)
//			.cornerRadius(20)
//		}
//		.presentationDetents([.medium])
//		.presentationDragIndicator(.visible)
//		.presentationBackground(.clear)
//	}
//}
//
//#Preview {
//    InstructionView()
//}
