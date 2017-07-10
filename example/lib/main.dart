import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/services.dart';
import 'package:flocation/flocation.dart';

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
  String _platformVersion = 'Unknown';
  List<double> _location = [];

  @override
  initState() {
    super.initState();
    initPlatformState();
    initLocationState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Flocation.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted)
      return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initLocationState() async {
    List<double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      location = await Flocation.location;
    } on PlatformException {
      location = Float64List(2);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted)
      return;

    setState(() {
      _location = location;
    });
  }

  Widget viewLocation(){
    if(_location.length <= 0){
      return new Text("No location");
    }else{
      double long = _location[0];
      double lat = _location[1];
      return new Text('Location($long , $lat)');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Column(
	  children: [new Center(
            child: new Text('Running on: $_platformVersion\n'),
          ),
	  new Center(
	    child: viewLocation(),
          ),]
	),
      ),
    );
  }
}
