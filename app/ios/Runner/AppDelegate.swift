import UIKit
import Flutter
//import HaishinKit
//import AVFoundation
//import VideoToolbox

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var methodChannel: FlutterMethodChannel? = nil
//    private var rtmpConnection = RTMPConnection()
//    private var rtmpStream: RTMPStream!
//
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        methodChannel = FlutterMethodChannel(name: "com.svprdga.haishinflutter/main", binaryMessenger: controller.binaryMessenger)
        
        methodChannel!.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            switch(call.method) {
            case "start_screencast":
                self.startScreencast(result: result)
                return
            default:
                result(FlutterMethodNotImplemented)
                return
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func startScreencast(result: FlutterResult) {
        print("Native call: start_screencast")
        
//        rtmpStream = RTMPStream(connection: rtmpConnection)
//
//        rtmpStream.captureSettings = [
//            .fps: 30, // FPS
//            .sessionPreset: AVCaptureSession.Preset.medium,
//        ]
//        rtmpStream.audioSettings = [
//            .muted: false, // mute audio
//            .bitrate: 32 * 1000,
//        ]
//        rtmpStream.videoSettings = [
//            .width: 640, // video output width
//            .height: 360, // video output height
//            .bitrate: 160 * 1000, // video output bitrate
//            .profileLevel: kVTProfileLevel_H264_Baseline_3_1, // H264 Profile require "import VideoToolbox"
//            .maxKeyFrameIntervalDuration: 2, // key frame / sec
//        ]
//        // "0" means the same of input
//        rtmpStream.recorderSettings = [
//            AVMediaType.audio: [
//                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//                AVSampleRateKey: 0,
//                AVNumberOfChannelsKey: 0,
//                // AVEncoderBitRateKey: 128000,
//            ],
//            AVMediaType.video: [
//                AVVideoCodecKey: AVVideoCodecH264,
//                AVVideoHeightKey: 0,
//                AVVideoWidthKey: 0,
//            ],
//        ]
//        
//        rtmpStream.attachScreen(ScreenCaptureSession(shared: UIApplication.shared))
//
//        rtmpConnection.connect("rtmp://192.168.1.128:1935/free")
//        rtmpStream.publish("stream")
        
        result(nil)
    }
}
