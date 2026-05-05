//
//  ContentView.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 4/30/26.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		NavigationStack {
			ZStack{
				ZStack(alignment: .topTrailing){
					Color(red: 0.96, green: 0.96, blue: 0.96).ignoresSafeArea()
					Image("breadBack").padding(.top,40)
				}
				VStack(){
					
					VStack(alignment: .leading, spacing: 18) {
						//Logo
						HStack(spacing:1){
							Text("B").font(.system(size: 50, weight: .heavy)).shadow(color:.black.opacity(0.2),radius: 0.5,x:0,y:3).foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
							Image("Logo").resizable().frame(width: 40, height: 40).ignoresSafeArea().shadow(color:.black.opacity(0.2),radius: 0.5,x:0,y:3)
							Text("KING").font(.system(size: 50, weight: .heavy)).shadow(color:.black.opacity(0.2),radius: 0.5,x:0,y:3).foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
							
							Spacer()
						}.padding(.leading,30)
						
						VStack(alignment:.leading,spacing:1){
							Text("Choose the recipe you're doing!").font(.system(size: 15, weight: .bold)).shadow(color:.black.opacity(0.2),radius: 0.5,x:0,y:3).foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
							Text("Scroll and tap to continue").font(.system(size: 10, weight: .light)).shadow(color:.black.opacity(0.2),radius: 0.5,x:0,y:3).foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
							
							Spacer()
						}.padding(.leading,30)
					}.padding(.top,50)
					
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(spacing: 24) {
							ForEach(RecipeData.recipeCategories) { category in
								RecipeCardView(category: category)
							}
							
						}
						.padding(.horizontal, 24)
						.padding(.vertical, 40)
					}.padding(.bottom,30)
					Spacer()
					VStack(){
						Image("bar")
						(
							Text("BAKING ").foregroundColor(Color(red: 0.95, green: 0.65, blue: 0.55))
							+
							Text("is currently in public Beta. We are refining our recipes and tools daily. While we strive for perfection, results may vary and are not 100% accurate. Thank you for your feedback!")
								.foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
						).italic().font(.system(size: 13, weight: .light)).multilineTextAlignment(.center).padding(.horizontal,40)
					}.padding(.bottom,50)
				}
			}
		}
	}
}

#Preview {
	HomeView()
}
