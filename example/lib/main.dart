import 'package:flutter/material.dart';
import 'package:open_apps_settings/open_apps_settings.dart';
import 'package:open_apps_settings/settings_enum.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Function _function;

  @override
  void initState() {
    super.initState();
    _function = () {
      print("do stuff here After returning back to setting page!");
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Open Apps Setting Plugin Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.APP_SETTINGS,
                          onCompletion: _function);
                    },
                    child: Text("OPEN APP SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.BLUETOOTH);
                    },
                    child: Text("OPEN BLUETOOTH SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.WIFI);
                    },
                    child: Text("OPEN WIFI SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.ACCESSIBILITY);
                    },
                    child: Text("OPEN ACCESSIBILITY SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.ADD_ACCOUNT);
                    },
                    child: Text("OPEN ADD ACCOUNT SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.AIRPLANE_MODE);
                    },
                    child: Text("OPEN AIRPLANE SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.ALL_APPS_SETTINGS);
                    },
                    child: Text("OPEN ALL APP SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.APN);
                    },
                    child: Text("OPEN APN SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.BATTERY_SAVER);
                    },
                    child: Text("OPEN BATTERY SAVER SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.KEYBOARD);
                    },
                    child: Text("OPEN KEYBOARD SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.DATA_USAGE);
                    },
                    child: Text("OPEN DATA USAGE SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.DATE);
                    },
                    child: Text("OPEN DATE SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.DEVICE_INFO);
                    },
                    child: Text("OPEN DEVICE INFO SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.DISPLAY);
                    },
                    child: Text("OPEN DISPLAY SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.HOME);
                    },
                    child: Text("OPEN HOME SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.INTERNAL_STORAGE);
                    },
                    child: Text("OPEN INTERNAL STORAGE SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.NFC);
                    },
                    child: Text("OPEN NFC SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.NOTIFICATION);
                    },
                    child: Text("OPEN NOTIFICATION SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.SOUND);
                    },
                    child: Text("OPEN SOUND SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.BATTERY_OPTIMIZATION);
                    },
                    child: Text("OPEN BATTERY OPTIMIZATION SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.LOCATION);
                    },
                    child: Text("OPEN LOCATION SETTINGS")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.LOCALE);
                    },
                    child: Text("OPEN LOCALE SETTINGS")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
