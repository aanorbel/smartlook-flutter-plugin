import 'dart:async';
import 'package:flutter/services.dart';

class Smartlook {
	static const MethodChannel _channel =
		const MethodChannel('smartlook');

	static Future<String> get platformVersion async {
		final String version = await _channel.invokeMethod('getPlatformVersion');
    	return version;
	}

	static start(String key) {
		_channel.invokeMethod('start', [key]);
	}

	static recordEvent(String eventName) {
		_channel.invokeMethod('recordEvent', [eventName]);
	}

	static setUserIdentifier(String userIdentifier) {
		_channel.invokeMethod('setUserIdentifier', [userIdentifier]);
	}

}
