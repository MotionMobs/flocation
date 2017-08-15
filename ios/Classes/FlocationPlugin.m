#import "FlocationPlugin.h"

@implementation FlocationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  LocationStreamHandler* locationStreamHandler = [[LocationStreamHandler alloc] init];
  FlutterEventChannel* locationChannel = [FlutterEventChannel eventChannelWithName: @"motionmobs.com/flocation" binaryMessenger: [registrar messenger]];
  [locationChannel setStreamHandler: locationStreamHandler];
}
@end

@implementation LocationStreamHandler
- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    int kNumberOfIterations = 100;

    //TODO: stream location events!
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //Background Thread
        for( int i; i < kNumberOfIterations; i++) {
          NSNumber* lat = [NSNumber numberWithDouble: (double)i];
          NSNumber* lng = [NSNumber numberWithDouble: (double)i];
          NSNumber* elev = [NSNumber numberWithDouble: (double)i];
          NSNumber* acc = [NSNumber numberWithDouble: (double)i];
          NSArray* value = @[lat,lng,elev,acc];
          eventSink(value);
          sleep(1);
        }
      });
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
  //TODO: clean up!
  return nil;
}
@end
