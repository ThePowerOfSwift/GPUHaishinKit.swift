import lf
import GPUImage
import Foundation

public extension NetStream {
    private static let tag:String = "com.haishinkit.GPUImageRawOutput"
    private static let size:CGSize = CGSize(width: 355, height: 288)

    public var rawDataOutput:GPUImageRawDataOutput {
        if let output:HaishinGPUImageRawOutput = metadata[NetStream.tag] as? HaishinGPUImageRawOutput {
            return output
        }
        var size:CGSize?
        if let width:Int = videoSettings["width"] as? Int, let height:Int = videoSettings["height"] as? Int {
            size = CGSize(width: width, height: height)
        }
        let output = HaishinGPUImageRawOutput(imageSize: size ?? NetStream.size)
        output.delegate = self
        metadata[NetStream.tag] = output
        return output
    }

    public func attachGPUImageVideoCamera(_ camera:GPUImageVideoCamera) {
        mixer.session = camera.captureSession
    }
}
