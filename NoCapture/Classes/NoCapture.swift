//
//  NoCapture.swift
//  NoCapture
//
//  Created by Marvin Böddeker on 09.01.18.
//

import Foundation
import UIKit

public protocol NoCaptureDelegate {
    func screenCaptureStatusChanged(isRecording: Bool)
}


public class NoCapture {

    public static let instance = NoCapture()
    public var delegate: NoCaptureDelegate?
    private var timer: Timer?

    private var isRecording: Bool = false {
        didSet {
            delegate?.screenCaptureStatusChanged(isRecording: isRecording)
        }
    }

    @objc private func detectRecordingStatus() {
        for screen in UIScreen.screens {
            if #available(iOS 11.0, *) {
                if screen.isCaptured || screen.mirrored != nil {
                    self.isRecording = true
                    return
                }
            } else {
                self.isRecording = screen.mirrored != nil
                return
            }
        }
        isRecording = false
    }

    public func startDetection() {
        startTimer()
    }

    public func stopDetection() {
        stopTimer()
    }

    private func startTimer() {
        let screenCaptureDetector = NoCapture.instance
        if screenCaptureDetector.timer != nil { stopTimer() }
        screenCaptureDetector.timer = Timer.scheduledTimer(timeInterval: 1.0, target: screenCaptureDetector, selector: #selector(detectRecordingStatus), userInfo: nil, repeats: true)
    }

    private func stopTimer() {
        let screenCaptureDetector = NoCapture.instance
        if screenCaptureDetector.timer != nil {
            screenCaptureDetector.timer?.invalidate()
            screenCaptureDetector.timer = nil
        }
    }


}

