//
//  ImagePlaceholder.swift
//  ba-king
//
//  Created by wijayarakhmat98 on 5/4/26.
//

import SwiftUI

struct ImagePlaceholder: View {
	let image: Image?

	var body: some View {
		if let image {
			image
		} else {
			Color.gray
		}
	}
}

#Preview {
	ImagePlaceholder(image: nil)
}
