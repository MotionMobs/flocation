import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flocation/flocation.dart';
import 'dart:async';

void main() {
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.io/testing/ for more info.
  enableFlutterDriverExtension();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _locationValues = '';
  StreamSubscription<dynamic> _streamSubscription = null;

  @override
  Widget build(BuildContext context) {
    final String location = _locationValues;
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      body: new Center(
          child: new Column(
        children: [
          new Center(
            child: new Text('Running on: $location\n'),
          ),
        ],
      )),
    ));
  }

  @override
  dispose() {
    super.dispose();
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
    }
  }

  @override
  initState() {
    super.initState();
    _streamSubscription = Flocation.locationEvents.listen((LocationEvent event) {
      setState(() {
        _locationValues = event.toString();
      });
    });
  }
}
