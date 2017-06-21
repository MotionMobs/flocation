#import "FlocationPlugin.h"
#import <flocation/flocation-Swift.h>

@implementation FlocationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlocationPlugin registerWithRegistrar:registrar];
}
@end
