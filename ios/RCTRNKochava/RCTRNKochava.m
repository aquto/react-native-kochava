#import "RCTRNKochava.h"
#import "KochavaTracker.h"

@implementation RNKochava

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(init,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    NSMutableDictionary *trackerParametersDictionary = [NSMutableDictionary dictionary];
    trackerParametersDictionary[kKVAParamAppGUIDStringKey] = @"komidata-ios-test-4lrid";
    trackerParametersDictionary[kKVAParamLogLevelEnumKey] = kKVALogLevelEnumDebug;
    [KochavaTracker.shared configureWithParametersDictionary:trackerParametersDictionary delegate:self];
  });
  resolve(@"Hello World!");
}

RCT_EXPORT_METHOD(identityLink:(NSDictionary *)identityLinkDictionary
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    [KochavaTracker.shared sendIdentityLinkWithDictionary:identityLinkDictionary];
    resolve(@"Hello World!");
}

RCT_EXPORT_METHOD(sendEvent:(NSString *)eventName
                  info:(NSDictionary *)info
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    [KochavaTracker.shared sendEventWithNameString:eventName infoDictionary:info];
    resolve(@"Hello World!");
}

@end
