//
//  RecipeCardView.swift
//  ba-king
//
//  Created by Samuel Jeremy Winoto on 04/05/26.
//

import Foundation

import SwiftUI

struct RecipeCardView: View {
		let category: RecipeCategory
		
		var body: some View {
				ZStack(alignment: .bottomLeading) {
						
						//Image call
						Image(category.imageName).resizable().scaledToFill().frame(width: 280, height: 380).clipped()
						
						//Gradation Bottom image
						LinearGradient(
								gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
								startPoint: .center,
								endPoint: .bottom
						)
						
						//text call
						VStack(alignment: .leading, spacing: 4) {
							Text(category.title).font(.system(size: 48, weight: .heavy)).foregroundColor(Color(red:1, green:1, blue:1))
							.shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2).lineLimit(2)//shadow
								
							Text(category.subtitle).font(.system(size: 14)).italic().foregroundColor(Color(red: 1, green: 1, blue: 1).opacity(0.9)).lineLimit(2)
						}.padding(20)
						
				}.frame(width: 280, height: 380).clipShape(RoundedRectangle(cornerRadius: 32))
				//outline
				.overlay(
						RoundedRectangle(cornerRadius: 32).stroke(Color(red: 0.96, green: 0.89, blue: 0.87), lineWidth: 10)
				).shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 8)
		}
}
