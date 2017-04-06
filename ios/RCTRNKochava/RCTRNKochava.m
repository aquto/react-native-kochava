#import "RCTRNKochava.h"
#import "KochavaTracker.h"

@implementation RNKochava

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(init,
                 options: (NSDictionary *)options
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL *enableDebug = [RCTConvert BOOL:options[@"enableDebug"]];
    NSString *appId = [RCTConvert NSString:options[@"appId"]];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableDictionary *trackerParametersDictionary = [NSMutableDictionary dictionary];
        trackerParametersDictionary[kKVAParamAppGUIDStringKey] = appId;
        if (enableDebug) {
            trackerParametersDictionary[kKVAParamLogLevelEnumKey] = kKVALogLevelEnumDebug;
        }
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
