//
//  NoCapture.swift
//  FBSnapshotTestCase
//
//  Created by Marvin Böddeker on 09.01.18.
//

import Foundation
import UIKit

public protocol NoCaptureDelegate {
    func screenCaptureStatusChanged(isRecording: Bool)
}


class NoCapture {

    var isRecording: Bool = false {
        didSet {
            delegate?.screenCaptureStatusChanged(isRecording: isRecording)
        }
    }
    
    var delegate: NoCaptureDelegate?

    private func detectRecordingStatus() {
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
}
