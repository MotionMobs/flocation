import Flutter
import UIKit
    
public class SwiftFlocationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flocation", binaryMessenger: registrar.messenger());
    let instance = SwiftFlocationPlugin();
    registrar.addMethodCallDelegate(instance, channel: channel);
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion);
  }
}
