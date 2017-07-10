import 'dart:async';

import 'package:flutter/services.dart';

class Flocation {
  static const MethodChannel _channel =
      const MethodChannel('motionmobs.com/flocation');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');
      
  static Future<List<double>> get location =>
      _channel.invokeMethod('getLocation');
}
