import 'dart:async';
import 'package:flutter/services.dart';

class Smartlook {
  static const MethodChannel _channel = const MethodChannel('smartlook');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static start(String key) async {
    final Map<String, dynamic> params = <String, dynamic>{'key': key};

    await _channel.invokeMethod('start', params);
  }

  static recordEvent(String eventName) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'eventName': eventName
    };

    await _channel.invokeMethod('recordEvent', params);
  }

  static setUserIdentifier(String userIdentifier) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'userIdentifier': userIdentifier
    };
    await _channel.invokeMethod('setUserIdentifier', params);
  }
}
