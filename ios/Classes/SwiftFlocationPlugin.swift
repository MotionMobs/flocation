import Flutter
import UIKit

public class LocationStreamHandler: NSObject, FlutterStreamHandler{
    //for testing
    let kNumberOfIterations = 100;
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        //TODO: stream location events!
        DispatchQueue.global().async {
            for i in 0 ..< self.kNumberOfIterations {
                let lat = Double(i);
                let long = Double(i);
                let elev = Double(i);
                let acc = Double(i);
                events([lat,long,elev,acc]);
                sleep(1);
            }
        }
        return nil;
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        //TODO: clean up!
        return nil;
    }
}
    
public class SwiftFlocationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let handler = LocationStreamHandler();
    let channel = FlutterEventChannel(name: "motionmobs.com/flocation", binaryMessenger: registrar.messenger());
    channel.setStreamHandler(handler);
  }
}
