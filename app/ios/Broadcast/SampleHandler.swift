import HaishinKit
import AVFoundation
import VideoToolbox
import ReplayKit

class SampleHandler: RPBroadcastSampleHandler {
    
    private var rtmpConnection = RTMPConnection()
    private var rtmpStream: RTMPStream!
    private let apiClient = ApiClient()

    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional.
        print("Broadcast started")
        
        apiClient.test() { result in
           
        }

//        rtmpStream = RTMPStream(connection: rtmpConnection)
//
//        rtmpConnection.connect("rtmp://192.168.1.158:1935/free")
//        rtmpStream.publish("stream")
    }
    
    override func broadcastPaused() {
        // User has requested to pause the broadcast. Samples will stop being delivered.
        print("Broadcast paused")
    }
    
    override func broadcastResumed() {
        // User has requested to resume the broadcast. Samples delivery will resume.
        print("Broadcast resumed")
    }
    
    override func broadcastFinished() {
        // User has requested to finish the broadcast.
        print("Broadcast finished")
    }
    
    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with sampleBufferType: RPSampleBufferType) {
        switch sampleBufferType {
        case .video:
            if let description = CMSampleBufferGetFormatDescription(sampleBuffer) {
                let dimensions = CMVideoFormatDescriptionGetDimensions(description)
                rtmpStream.videoSettings = [
                    .width: dimensions.width,
                    .height: dimensions.height,
                    .bitrate: 2000000,
                    .profileLevel: kVTProfileLevel_H264_Baseline_AutoLevel
                ]
            }
            rtmpStream.appendSampleBuffer(sampleBuffer, withType: .video)
        case .audioApp:
            rtmpStream.appendSampleBuffer(sampleBuffer, withType: .audio)
            break
        case .audioMic:
            break
        @unknown default:
            break
        }
    }
}
