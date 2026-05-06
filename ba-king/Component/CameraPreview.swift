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

		func makeUIView(context: Context) -> VideoPreviewView {
				let view = VideoPreviewView()
				view.previewLayer.videoGravity = .resizeAspectFill
				view.previewLayer.session = session
				return view
		}

		func updateUIView(_ uiView: VideoPreviewView, context: Context) {
				if uiView.previewLayer.session !== session {
						uiView.previewLayer.session = session
				}
		}
}

class VideoPreviewView: UIView {
		override class var layerClass: AnyClass {
				AVCaptureVideoPreviewLayer.self
		}

		var previewLayer: AVCaptureVideoPreviewLayer {
				layer as! AVCaptureVideoPreviewLayer
		}
}
 
