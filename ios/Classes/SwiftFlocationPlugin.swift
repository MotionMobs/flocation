import Flutter
import UIKit
    
public class SwiftFlocationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "motionmobs.com/flocation", binaryMessenger: registrar.messenger());
    let instance = SwiftFlocationPlugin();
    registrar.addMethodCallDelegate(instance, channel: channel);
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion);
    case "getLocation":
        result([23.435,235.7890]);
    default:
        result("iOS " + UIDevice.current.systemVersion);
    }
    
  }
}
