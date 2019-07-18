package com.Smartlook.Smartlook.smartlook;

import com.smartlook.sdk.smartlook.Smartlook;

import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * SmartlookPlugin
 */
public class SmartlookPlugin implements MethodCallHandler {
    String tag = SmartlookPlugin.class.getSimpleName();

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "smartlook");
        channel.setMethodCallHandler(new SmartlookPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;
            case "start":
                String key = call.argument("key");
                if (key != null) {
                    Smartlook.setupAndStartRecording(key);
                    Log.d(tag, "Smartlook.setup " + key);
                }
                result.success("Some Message");
                break;
            case "recordEvent":
                String eventName = call.argument("eventName");
                if (eventName != null) {
                    Smartlook.startTimedCustomEvent(eventName);
                    Log.d(tag, "Smartlook.startTimedCustomEvent " + eventName);

                }
                result.success("Some Message");
                break;
            case "setUserIdentifier":
                String userIdentifier = call.argument("userIdentifier");

                if (userIdentifier != null) {
                    Smartlook.setUserIdentifier(userIdentifier);
                    Log.d(tag, "Smartlook.setUserIdentifier " + userIdentifier);

                }
                result.success("Some Message");
                break;
            default:
                result.notImplemented();
                break;
        }
    }
}
