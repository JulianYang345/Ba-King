//
//   CameraViewModel.swift
//  ba-king
//
//  Created by Laurentius Nicholas on 04/05/26.
//

import AVFoundation
import Combine
import SwiftUI
import Vision
 
class CameraViewModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
 
		@Published var authorizationStatus: AVAuthorizationStatus = .notDetermined
		@Published var matchPercentage: Double = 0.0   // stub — fill in once matching logic is ready
	
		private var goldenObservation: VNFeaturePrintObservation?
 
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
	
		// Golden truth setup
		func loadGoldenTruth(from image: UIImage) {
				guard let cgImage = image.cgImage else { return }
				
				let request = VNGenerateImageFeaturePrintRequest()
				let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
				
				do {
						try handler.perform([request])
						if let observation = request.results?.first as? VNFeaturePrintObservation {
								self.goldenObservation = observation
								print("Golden Truth loaded.")
						}
				} catch {
						print("Failed to load golden truth: \(error.localizedDescription)")
				}
		}
 
		// capture frame
		private func scheduleTimer() {
				timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
						self?.processLatestFrame()
				}
		}
 
		private func processLatestFrame() {
				// 1. Ensure we have a buffer and our golden truth is ready
				guard let buffer = latestBuffer,
							let pixelBuffer = CMSampleBufferGetImageBuffer(buffer),
							let goldenObservation = self.goldenObservation else { return }
				
				// 2. We move the heavy Vision processing to a background thread
				// so your UI doesn't stutter every 3 seconds.
				DispatchQueue.global(qos: .userInitiated).async { [weak self] in
						
						let request = VNGenerateImageFeaturePrintRequest()
						let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
						
						do {
								try handler.perform([request])
								guard let liveObservation = request.results?.first as? VNFeaturePrintObservation else { return }
								
								// 3. Calculate the distance
								var distance: Float = 0
								try liveObservation.computeDistance(&distance, to: goldenObservation)
								
								// 4. Convert distance (Float) to percentage (Double) and update UI
								let percentage = self?.convertDistanceToPercentage(distance) ?? 0.0
								
								DispatchQueue.main.async {
										self?.matchPercentage = percentage
								}
								
						} catch {
								print("Vision comparison failed: \(error.localizedDescription)")
						}
				}
		}
	
		private func convertDistanceToPercentage(_ distance: Float) -> Double {
				// A distance of 0 is a 100% match.
				// You will need to test with real batter to find the "max distance"
				// where the batter is completely wrong. Let's assume 30.0 for now.
				let maxDistance: Float = 30.0
				
				// Clamp the distance so it doesn't go over max
				let clampedDistance = min(max(distance, 0), maxDistance)
				
				// Invert it to get a percentage
				let percentage = (1.0 - (clampedDistance / maxDistance)) * 100.0
				
				return Double(percentage)
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
		
