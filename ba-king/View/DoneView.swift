//
//  DoneView.swift
//  ba-king
//
//  Created by Ady Subagya Junior on 05/05/26.
//

import SwiftUI

struct DoneView: View {
	@State private var MixAgain = false
	@State private var BackHome = false
	var body: some View {
		NavigationStack{
			ZStack {
				ZStack(alignment: .topTrailing){
					Color(red: 0.96, green: 0.96, blue: 0.96).ignoresSafeArea()
					Image("breadBack").padding(.top,40)
				}
				
				NavigationLink(destination: Main(), isActive: $MixAgain) {
					EmptyView()
				}.hidden()
				NavigationLink(destination: HomeView(), isActive: $BackHome) {
					EmptyView()
				}.hidden()
				
				VStack(spacing: 20) {
					VStack(spacing: 20){
						Spacer().frame(height: 40)
						
						Image("Logo")
							.resizable()
							.scaledToFit()
							.frame(width: 120)
						
						Text("YOU'VE DOUGH IT!")
							.font(.system(size: 25, weight: .bold))
							.foregroundColor(.primaryOrange)
						
						Text("Your dough looks ready to rest.")
							.font(.system(size: 15))
							.foregroundColor(Color(red: 0.30, green: 0.30, blue: 0.30))
						
						ZStack {
							Circle()
								.fill(Color.green)
								.frame(width: 75, height: 75)
							
							Image(systemName: "checkmark")
								.font(.system(size: 32))
								.foregroundColor(.white)
						}
					}
					
					HStack {
						Text("Progress")
							.foregroundColor(Color(red: 0.30, green: 0.30, blue: 0.30).opacity(0.80))
						
						Spacer()
						
						Text("100%")
							.foregroundColor(.green)
							.bold()
					}
					.padding(.horizontal, 35)
					
					RoundedRectangle(cornerRadius: 10)
						.fill(Color.green.opacity(0.6))
						.frame(height: 16)
						.padding(.horizontal, 35)
					
					VStack(spacing: 15) {
						
						HStack {
							Text("Dough type")
								.bold()
							
							Spacer()
							
							Text("Sponge Cake Dough")
						}
						
						Divider()
						
						HStack {
							Text("Status")
								.bold()
							
							Spacer()
							
							Text("READY")
								.foregroundColor(.green)
								.bold()
						}
						
						Divider()
						
						HStack {
							Image(systemName: "clock")
								.foregroundColor(.orange)
							
							Text("Let it rest for 10 minutes")
							
							Spacer()
						}
					}
					.padding()
					.background(Color.gray.opacity(0.15))
					.cornerRadius(20)
					.padding(.horizontal, 35)
					
					Button {
						MixAgain = true
						//										print("mix again")
					} label: {
						Text("Mix Another Dough")
							.foregroundColor(.white)
							.bold()
							.frame(maxWidth: .infinity)
							.padding()
							.background(Color.orange)
							.cornerRadius(18)
					}
					.padding(.horizontal, 35)
					
					Button {
						BackHome = true
					} label: {
						Text("Back Home")
							.foregroundColor(.gray)
							.bold()
							.frame(maxWidth: .infinity)
							.padding()
							.background(Color.gray.opacity(0.3))
							.cornerRadius(18)
					}
					.padding(.horizontal, 35)
					
					Spacer()
				}
			}
		}
	}
}

#Preview {
		DoneView()
}
