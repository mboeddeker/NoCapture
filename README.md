# NoCapture

Simple Screenrecordingdetector in Swift. Enjoy it.


## Usage
It's really simple to use.

```swift
import NoCapture

class ViewController: UIViewController, NoCaptureDelegate {

let captureDetector = NoCapture.instance

override func viewDidLoad() {
super.viewDidLoad()
captureDetector.delegate = self
captureDetector.startDetection()
}

// DELGATE METHOD
func screenCaptureStatusChanged(isRecording: Bool) {
if isRecording {
self.view.backgroundColor = UIColor.red
} else {
self.view.backgroundColor = UIColor.white
}
}

}
```

## Installation

NoCapture is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NoCapture'
```

## Author

Marvin Knabe, info@appgewaltig.de

## License

NoCapture is available under the MIT license. See the LICENSE file for more info.

