//
//  ViewController.swift
//  NoCapture
//
//  Created by mboeddeker on 01/09/2018.
//  Copyright (c) 2018 mboeddeker. All rights reserved.
//

import UIKit
import NoCapture

class ViewController: UIViewController, NoCaptureDelegate {

    let captureDetector = NoCapture.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        captureDetector.delegate = self
        captureDetector.startDetection()
    }

    func screenCaptureStatusChanged(isRecording: Bool) {
        if isRecording {
            self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }

}

