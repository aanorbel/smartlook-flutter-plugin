#import "SmartlookPlugin.h"
#import <Smartlook/Smartlook.h>

@implementation SmartlookPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"smartlook"
            binaryMessenger:[registrar messenger]];
  SmartlookPlugin* instance = [[SmartlookPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
	if ([@"getPlatformVersion" isEqualToString:call.method]) {
		result([@"iOS lul" stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
		
	// Start
	} else if ([@"start" isEqualToString:call.method]) {
		NSLog(@"flutter log: start args: %@, class: %@", [call.arguments description], [call.arguments class]);
		NSArray* args = call.arguments;
		if (args && args.count > 0) {
			NSString* key = [args objectAtIndex:0];
			if (key && [key isKindOfClass:[NSString class]] && key.length > 0) {
				[Smartlook startWithKey:key];
			} else {
				NSLog(@"Smartlook - missing API key");
			}
		} else {
			NSLog(@"Smartlook - missing API key");
		}
		
	// Record Event
	} else if ([@"recordEvent" isEqualToString:call.method]) {
		NSArray* args = call.arguments;
	  	if (args && args.count > 0) {
			NSString* eventName = [args objectAtIndex:0];
			
		  	if (eventName && [eventName isKindOfClass:[NSString class]] && eventName.length > 0) {
				[Smartlook recordCustomEventWithEventName:eventName propertiesDictionary:nil];
		  	} else {
				NSLog(@"Smartlook - missing event name");
			}
		} else {
			NSLog(@"Smartlook - missing event name");
		}

	// Set User identifier
	} else if ([@"setUserIdentifier" isEqualToString:call.method]) {
		NSArray* args = call.arguments;
		if (args && args.count > 0) {
			NSString* userIdentifier = [args objectAtIndex:0];
			
			if (userIdentifier && [userIdentifier isKindOfClass:[NSString class]] && userIdentifier.length > 0) {
				[Smartlook setUserIdentifier:userIdentifier];
			}
		}

	} else {
		result(FlutterMethodNotImplemented);
	}
}

@end
