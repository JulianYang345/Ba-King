//
//  CameraPreview.swift
//  ba-king
//
//  Created by Laurentius Nicholas on 04/05/26.
//

import SwiftUI
import AVFoundation
 
struct CameraPreview: UIViewRepresentable {
		let session: AVCaptureSession
 
		func makeUIView(context: Context) -> UIView {
				let view = UIView()
				let previewLayer = AVCaptureVideoPreviewLayer(session: session)
				previewLayer.videoGravity = .resizeAspectFill
				previewLayer.frame = UIScreen.main.bounds
				view.layer.addSublayer(previewLayer)
				return view
		}
 
		func updateUIView(_ uiView: UIView, context: Context) {
				if let layer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
						layer.frame = UIScreen.main.bounds
				}
		}
}
 
