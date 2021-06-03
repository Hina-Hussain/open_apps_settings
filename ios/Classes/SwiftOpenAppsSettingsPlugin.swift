import Flutter
import UIKit

public class SwiftOpenAppsSettingsPlugin: NSObject, FlutterPlugin {
      var myResult:FlutterResult? = nil
      var isSettingOpen:Bool = false
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "open_apps_settings", binaryMessenger: registrar.messenger())
    let instance = SwiftOpenAppsSettingsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.addApplicationDelegate(instance)
  }

   public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method.elementsEqual("openSettings")){
            self.myResult = result
            openSettings(withResult:result)

        }
        else{
            result(FlutterMethodNotImplemented)
        }

      }
        private func openSettings(withResult result: @escaping FlutterResult){

            guard let settingUrl = URL(string:UIApplication.openSettingsURLString)
            else {
                return
            }
            // now open settings with above url
            if UIApplication.shared.canOpenURL(settingUrl){

                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingUrl,options: [:],completionHandler:{
                        (success)in
                        self.isSettingOpen = success
                    })
                } else {
                    // Fallback on earlier versions
                    UIApplication.shared.openURL(settingUrl)
                }
            }
            else{
                // could not open url
                result("Could not open Settings!");
            }
        }

        public func applicationDidBecomeActive(_ application: UIApplication) {

        }

        public func applicationWillTerminate(_ application: UIApplication) {

        }

        public func applicationWillResignActive(_ application: UIApplication) {

        }

        public func applicationDidEnterBackground(_ application: UIApplication) {

        }

        public func applicationWillEnterForeground(_ application: UIApplication) {
            if(self.isSettingOpen){
                self.isSettingOpen = false
                self.myResult!("success")
            }
        }
    }
