//
//  Main.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct Main: View {
	var body: some View {
		NavigationStack{
			NavigationLink(destination: Tips()){
				Text("Tips")
			}
		}
	}
}

#Preview {
	Main()
}
