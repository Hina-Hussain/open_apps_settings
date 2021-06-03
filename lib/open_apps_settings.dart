/*@Author Hina Hussain on 5-May-2021
* */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settings_enum.dart';

class OpenAppsSettings {
  static const MethodChannel _channel =
      const MethodChannel('open_apps_settings');

  ///this method is used to open settings. As a input user will specify which settings should be
  /// open. All SettingsCode are defined in SettingsCode enum. onCompletion method is optional.
  /// If user wants to execute something after returning back from settings then can pass
  /// through onCompletion method*/

  static Future<void> openAppsSettings(
      {@required SettingsCode settingsCode, Function onCompletion}) async {
    try {
      String code = settingsCode.toString();
      code = code.substring(13);
      String res = await _channel
          .invokeMethod("openSettings", {"setting_code": code.toLowerCase()});
      if (res != null && res.length > 0) {
        if (onCompletion != null) onCompletion();
      }
    } on PlatformException catch (e) {
      throw PlatformException(
          code: e.code,
          message: e.message,
          details: e.details,
          stacktrace: e.stacktrace);
    }
  }
}
