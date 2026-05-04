//
//  Main.swift
//  ba-king
//
//  Created by Julian Yang on 04/05/26.
//

import SwiftUI

struct Main: View {
	@State private var similarity = 0.37
    var body: some View {
			NavigationStack { // Might not need navigation stack to encapsulate Zstack
				ZStack{
					Image("main - VERTICAL")
					
					VStack(spacing:24){
						VStack(spacing: 8){
							
							// Reference
							Text("REFERENCE")
								.font(.custom("Helvetica", size: 16))
								.bold()
							RoundedRectangle(cornerRadius: 20)
								.fill(Color(red: 0.85, green: 0.85, blue: 0.85))
								.frame(height: 200)
							
							// Live Feed
							Text("LIVE FEED")
								.font(.custom("Helvetica", size: 16))
								.bold()
							RoundedRectangle(cornerRadius: 20)
								.fill(Color(red: 0.85, green: 0.85, blue: 0.85))
								.frame(height: 350)
							
							// Progress Bar
							HStack(){
								Text("Progress")
									.foregroundStyle(Color(red: 0.53, green: 0.45, blue: 0.39))
								Spacer()
								Text("\((similarity*100).formatted(.number.precision(.fractionLength(0))))%")
									.foregroundStyle(Color(red: 0.53, green: 0.45, blue: 0.39))
							}
							
							ProgressView(value: similarity)
								.tint(Color(red: 0.87, green: 0.47, blue: 0.37))
								.scaleEffect(x: 1, y: 2, anchor: .center)
							
							// 4. FOOTER DISCLAIMER
							Text("BAKING is currently in public Beta. We are refining our recipes and tools daily. While we strive for perfection, results may vary and are not 100% accurate. Thank you for your feedback!")
									.font(.system(size: 10))
									.italic()
									.foregroundColor(.gray)
									.multilineTextAlignment(.center)
									.padding(.top, 8)
						}
						.padding(.horizontal, 26)
				  }
				}
				// Toolbar, can be improved imo.
				.navigationBarTitleDisplayMode(.inline)
				.toolbar{
					ToolbarItem(placement: .topBarLeading){
						Button(action: {})
						{
							Image(systemName: "chevron.backward")
						}
					}
					ToolbarItem(placement: .principal){
						VStack(){
							Text("MIXING CHECKER")
								.font(.system(size: 15, weight: .bold))
							Text("MIX UNTIL THE BAR REACHES 100%")
								.font(.system(size: 12, weight: .medium))
								.foregroundStyle(Color(red: 0.85, green: 0.85, blue: 0.85))
						}
					}
					ToolbarItem(placement: .topBarTrailing){
						Button(action: {}) {
							Image(systemName: "lightbulb.max.fill")
						}
					}
				}
			}
    }
}

#Preview {
    Main()
}
