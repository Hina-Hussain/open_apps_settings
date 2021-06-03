#import "OpenAppsSettingsPlugin.h"
#if __has_include(<open_apps_settings/open_apps_settings-Swift.h>)
#import <open_apps_settings/open_apps_settings-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "open_apps_settings-Swift.h"
#endif

@implementation OpenAppsSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOpenAppsSettingsPlugin registerWithRegistrar:registrar];
}
@end
