# flocation

A Flutter plugin to access the gps location events.


## Usage

To use this plugin, add `flocation` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).


### Example

``` dart
import 'package:flocation/flocation.dart';

Flocation.locationEvents.listen((LocationEvent event) {
 // Do something with the event.
});
```

## General Flutter Help

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).