import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:smartlook/smartlook.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    Smartlook.start('beta_a76b285a70ecfb2b2cc13a13b0be2de6b60acf99');
    Smartlook.setUserIdentifier('FlutterLul');
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Smartlook.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          //child: Text('Running on: $_platformVersion\n'),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Smartlook.recordEvent('Event 1');
                },
                child: const Text(
                  'Event 1',
                  style: TextStyle(fontSize: 20)
                ),
              ),

              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Smartlook.recordEvent('Event 2');
                },
                child: const Text(
                  'Event 2',
                  style: TextStyle(fontSize: 20)
                ),
              ),

              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Smartlook.recordEvent('Event 3');
                },
                child: const Text(
                  'Event 3',
                  style: TextStyle(fontSize: 20)
                ),
              ),
              
            ],
          ),
        ),      
      ),
    );
  }
}
