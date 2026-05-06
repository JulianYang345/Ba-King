//
//  Main.swift
//  ba-king
//
//  Created by Julian Yang on 04/05/26.
//

import SwiftUI
 
struct Main: View {
		@StateObject private var cameraVM = CameraViewModel()
		@State private var isNavigating = false
		@State private var isDone = false

		var body: some View {
//				NavigationStack {
						ZStack {
								Image("main - VERTICAL")
 
								VStack(spacing: 24) {
										VStack(spacing: 8) {
 
												// Reference
												Text("REFERENCE")
														.font(.custom("Helvetica", size: 16))
														.bold()
												Image("PerfectBatter")
														.resizable()
														.scaledToFill()
														.frame(height: 200)
														.clipShape(RoundedRectangle(cornerRadius: 20))
 
												// Live Feed
												Text("LIVE FEED")
														.font(.custom("Helvetica", size: 16))
														.bold()
												CameraPreview(session: cameraVM.session)
														.frame(height: 350)
														.clipShape(RoundedRectangle(cornerRadius: 20))
														.ignoresSafeArea()
 
												// Progress Bar
												HStack {
														Text("Progress")
																.foregroundStyle(Color(red: 0.53, green: 0.45, blue: 0.39))
														Spacer()
														Text("\((cameraVM.matchPercentage * 100).formatted(.number.precision(.fractionLength(0))))%")
																.foregroundStyle(Color(red: 0.53, green: 0.45, blue: 0.39))
												}
 
												ProgressView(value: cameraVM.matchPercentage)
														.tint(Color(red: 0.87, green: 0.47, blue: 0.37))
														.scaleEffect(x: 1, y: 2, anchor: .center)
 
												// Footer Disclaimer
												Text("BAKING is currently in public Beta. We are refining our recipes and tools daily. While we strive for perfection, results may vary and are not 100% accurate. Thank you for your feedback!")
														.font(.system(size: 10))
														.italic()
														.foregroundColor(.gray)
														.multilineTextAlignment(.center)
														.padding(.top, 8)
										}
										.padding(.horizontal, 26)
								}
							NavigationLink("", destination: Tips(), isActive: $isNavigating)
							NavigationLink("", destination: DoneView(), isActive: $isDone)
						}
						.onAppear {
								// 2. Load the image safely into memory
								if let goldenUIImage = UIImage(named: "PerfectBatter") {
										// Feed the visual signature to your analyzer
										cameraVM.loadGoldenTruth(from: goldenUIImage)
								} else {
										print("Error: Could not find 'PerfectBatter' in Assets.")
								}
								
								// Start the camera feed
								cameraVM.start()
						}
						.onDisappear { cameraVM.stop() }
						.onChange(of: cameraVM.matchPercentage) { newValue in
								if newValue >= 0.85 { // 85% to account for real world lighting
										isDone = true
								}
						}
						.navigationBarTitleDisplayMode(.inline)
						.toolbar {
								ToolbarItem(placement: .principal) {
										VStack {
												Text("MIXING CHECKER")
														.font(.system(size: 15, weight: .bold))
												Text("MIX UNTIL THE BAR REACHES 100%")
														.font(.system(size: 12, weight: .medium))
														.foregroundStyle(Color(red: 0.85, green: 0.85, blue: 0.85))
										}
								}
						
								ToolbarItem(placement: .topBarTrailing) {
									Button {
										isNavigating = true} label: {
											Image(systemName: "lightbulb.max.fill")
										}
								}
						}
				}
		}
//}
 
#Preview {
		Main()
}
