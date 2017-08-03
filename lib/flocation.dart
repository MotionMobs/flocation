import 'dart:async';

import 'package:flutter/services.dart';

class LocationEvent{
  final double latitude;
  final double longitude;
  final double elevation;

  LocationEvent(this.latitude, this.longitude, this.elevation);

  LocationEvent.fromList(List<double> list) : this(list[0], list[1], list[2]);

  @override
    String toString() => '[LocationEvent (lat: $latitude, long: $longitude, elev: $elevation)]';
}

class Flocation {
  static Stream<LocationEvent> _locationEvents;
  static const EventChannel _locationEventChannel =
      const EventChannel('motionmobs.com/flocation');

  static Stream<LocationEvent> get locationEvents {
    if(_locationEvents == null) {
       _locationEvents = _locationEventChannel
         .receiveBroadcastStream()
         .map((x) => new LocationEvent.fromList(x));
    }
    return _locationEvents;
  }
}
