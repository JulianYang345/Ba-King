//
//   CameraViewModel.swift
//  ba-king
//
//  Created by Laurentius Nicholas on 04/05/26.
//

import AVFoundation
import Combine
import SwiftUI
 
class CameraViewModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
 
		@Published var authorizationStatus: AVAuthorizationStatus = .notDetermined
		@Published var matchPercentage: Double = 0.0   // stub — fill in once matching logic is ready
 
		let session = AVCaptureSession()
 
		private let videoOutput = AVCaptureVideoDataOutput()
		private var latestBuffer: CMSampleBuffer?
		private var timer: Timer?
 
		// start stop
		func start() {
			#if !targetEnvironment(simulator)

				checkAuthorization()
				scheduleTimer()
			#endif

		}
 
		func stop() {
				timer?.invalidate()
				timer = nil
				#if !targetEnvironment(simulator)

				session.stopRunning()
				#endif

		}
		#if !targetEnvironment(simulator)

		// Authorization + Setup
		private func checkAuthorization() {
				switch AVCaptureDevice.authorizationStatus(for: .video) {
				case .authorized:
						authorizationStatus = .authorized
						setupCamera()
 
				case .notDetermined:
						AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
								DispatchQueue.main.async {
										self?.authorizationStatus = granted ? .authorized : .denied
										if granted { self?.setupCamera() }
								}
						}
 
				case .denied, .restricted:
						authorizationStatus = .denied
 
				@unknown default:
						authorizationStatus = .denied
				}
		}
 
		private func setupCamera() {
				session.beginConfiguration()
 
				guard
						let device = AVCaptureDevice.default(for: .video),
						let input  = try? AVCaptureDeviceInput(device: device),
						session.canAddInput(input)
				else {
						session.commitConfiguration()
						return
				}
 
				session.addInput(input)
 
				videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "camera.frame.queue"))
				if session.canAddOutput(videoOutput) {
						session.addOutput(videoOutput)
				}
 
				session.commitConfiguration()
 
				DispatchQueue.global(qos: .userInitiated).async { [weak self] in
						self?.session.startRunning()
				}
		}
 
		// capture frame
		private func scheduleTimer() {
				timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
						self?.processLatestFrame()
				}
		}
 
		private func processLatestFrame() {
				guard
						let buffer = latestBuffer,
						let image  = convertToUIImage(buffer: buffer)
				else { return }
 
				// buat nanti matching
				_ = image
		}
 
		private func convertToUIImage(buffer: CMSampleBuffer) -> UIImage? {
				guard let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) else { return nil }
				let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
				let context = CIContext()
				guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }
				return UIImage(cgImage: cgImage)
		}
 
		func captureOutput(_ output: AVCaptureOutput,
											 didOutput sampleBuffer: CMSampleBuffer,
											 from connection: AVCaptureConnection) {
				latestBuffer = sampleBuffer
		}
	#endif
}
		
