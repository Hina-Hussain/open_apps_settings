/*@Author Hina Hussain Created Date 5-May-2021*/
package com.creativemind.open_apps_settings;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** OpenAppsSettingsPlugin */
public class OpenAppsSettingsPlugin implements FlutterPlugin, MethodCallHandler, PluginRegistry.ActivityResultListener, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;
  private Result activityRes;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "open_apps_settings");
    channel.setMethodCallHandler(this);
  }



  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    this.activityRes = result;
    if(call.method.equals("openSettings")){
      String settingCode =  call.argument("setting_code");
      switch (settingCode != null ? settingCode : "") {
        case "app_settings":
          openAppSettings();
          break;
        case "wifi":
          openSettings(Settings.ACTION_WIFI_SETTINGS, RequestCodes.WIFI_SETTINGS);
          break;
        case "bluetooth":
          openSettings(Settings.ACTION_BLUETOOTH_SETTINGS, RequestCodes.BLUETOOTH_SETTINGS);
          break;
        case "accessibility":
          openSettings(Settings.ACTION_ACCESSIBILITY_SETTINGS, RequestCodes.ACCESSIBILITY_SETTINGS);
          break;
        case "add_account":
          openSettings(Settings.ACTION_ADD_ACCOUNT, RequestCodes.ADD_ACCOUNT);
          break;
        case "airplane_mode":
          openSettings(Settings.ACTION_AIRPLANE_MODE_SETTINGS, RequestCodes.AIRPLANE_MODE_SETTINGS);
          break;
        case "apn":
          openSettings(Settings.ACTION_APN_SETTINGS, RequestCodes.APN_SETTINGS);
          break;
        case "all_apps_settings":
          openSettings(Settings.ACTION_APPLICATION_SETTINGS, RequestCodes.APPLICATIONS_SETTINGS);
          break;
        case "battery_saver":

          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1)
            openSettings(Settings.ACTION_BATTERY_SAVER_SETTINGS, RequestCodes.BATTERY_SAVER_SETTINGS);
          else
            result.error("NOT SUPPORTED", "Field requires API level 22 or higher", null);

          break;
        case "keyboard":
          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N)
            openSettings(Settings.ACTION_HARD_KEYBOARD_SETTINGS, RequestCodes.KEYBOARD_SETTINGS);
          else
            result.error("NOT SUPPORTED", "Field requires API level 24 or higher", null);

          break;
        case "data_usage":

          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P)
            openSettings(Settings.ACTION_DATA_USAGE_SETTINGS, RequestCodes.DATA_USAGE_SETTINGS);
          else
            openSettings(Settings.ACTION_DATA_ROAMING_SETTINGS, RequestCodes.DATA_USAGE_SETTINGS);
          break;
        case "date":
          openSettings(Settings.ACTION_DATE_SETTINGS, RequestCodes.DATE_SETTINGS);
          break;
        case "device_info":
          openSettings(Settings.ACTION_DEVICE_INFO_SETTINGS, RequestCodes.DEVICE_INFO_SETTINGS);
          break;
        case "display":
          openSettings(Settings.ACTION_DISPLAY_SETTINGS, RequestCodes.DISPLAY_SETTINGS);
          break;
        case "home":

          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
            openSettings(Settings.ACTION_HOME_SETTINGS, RequestCodes.HOME_SETTINGS);
          else
            result.error("NOT SUPPORTED", "Field requires API level 21 or higher", null);

          break;
        case "internal_storage":
          openSettings(Settings.ACTION_INTERNAL_STORAGE_SETTINGS, RequestCodes.INTERNAL_STORAGE_SETTINGS);
          break;
        case "fingerprint_enroll":

          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P)
            openSettings(Settings.ACTION_FINGERPRINT_ENROLL, RequestCodes.FINGERPRINT_ENROL);
          else
            result.error("NOT SUPPORTED", "Field requires API level 28 or higher", null);

          break;
        case "locale":
          openSettings(Settings.ACTION_LOCALE_SETTINGS,RequestCodes.LOCALE_SETTINGS);
          break;
        case "location":
          openSettings(Settings.ACTION_LOCATION_SOURCE_SETTINGS,RequestCodes.LOCATION_SOURCE_SETTINGS);
          break;
        case "privacy":
          openSettings(Settings.ACTION_PRIVACY_SETTINGS,RequestCodes.PRIVACY_SETTINGS);
          break;
        case "battery_optimization":
          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M)
            openSettings(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS,RequestCodes.BATTERY_OPTIMIZATION_SETTINGS);
          else
            result.error("NOT SUPPORTED","Field required API level 23 or higher",null);
          break;
        case "nfc":
          openSettings(Settings.ACTION_NFC_SETTINGS,RequestCodes.NFC_SETTING);
          break;
        case "sound":
          openSettings(Settings.ACTION_SOUND_SETTINGS,RequestCodes.SOUND_SETTINGS);
          break;
        case "notification":
          openNotification();
          break;
        default:
          result.notImplemented();
          break;
      }
    }
    else{
      result.notImplemented();
    }

  }




  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
    if(activityRes!=null){
      activityRes.success(""+requestCode);
    }

    return true;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
    binding.addActivityResultListener(this);

  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    this.activity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
    binding.addActivityResultListener(this);
  }

  @Override
  public void onDetachedFromActivity() {
    this.activity = null;
  }
  // private method to open Application specific setting
  private void openAppSettings() {
    Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
    intent.setData(Uri.fromParts("package",activity.getPackageName(),null));
    activity.startActivityForResult(intent,RequestCodes.APP_DETAIL_SETTINGS);
  }
  // private method to open all settings
  private void openSettings(String intentString,int permissionCode){
    try {
      Intent intent = new Intent(intentString);
      activity.startActivityForResult(intent,permissionCode);
    }
    catch (Exception e){
      openAppSettings();
    }
  }
  // private method to open notification
  private void openNotification() {
    if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.O){
      Intent intent = new Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS);
      intent.putExtra(Settings.EXTRA_APP_PACKAGE,activity.getPackageName());
      activity.startActivityForResult(intent,RequestCodes.NOTIFICATION_SETTINGS);
    }
    else{
      Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
      intent.setData(Uri.parse("package:"+activity.getPackageName()));
      activity.startActivityForResult(intent,RequestCodes.NOTIFICATION_SETTINGS);
    }
  }
}
