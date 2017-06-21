import 'dart:async';

import 'package:flutter/services.dart';

class Flocation {
  static const MethodChannel _channel =
      const MethodChannel('flocation');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');
}
