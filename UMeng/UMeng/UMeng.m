//
//  UMengIOS.m
//  UMengIOS
//
//  Created by mani on 13-1-16.
//  Copyright (c) 2013年 pamakids. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import "MobClick.h"
#import "UMeng.h"
#import "OpenUDID.h"

FREObject onResume(FREContext context, void* funcData, uint32_t argc, FREObject argv[]){
    //不需要
    return nil;
}

FREObject onPause(FREContext context, void* funcData, uint32_t argc, FREObject argv[]){
    //不需要
    return nil;
}

FREObject startAnaly(FREContext context, void* funcData, uint32_t argc, FREObject argv[]){
    
    const uint8_t* appKey;
    const uint8_t* channelID;
    uint32_t* isDebug = NULL;
    uint32_t stringLength;
    NSString *appKeyString = nil;
    NSString *channelIDString = nil;
    
    if(argv[0] && (FREGetObjectAsUTF8(argv[0], &stringLength, &appKey) == FRE_OK)){
        appKeyString = [NSString stringWithUTF8String:(char*)appKey];
    }
    if(argv[1] && (FREGetObjectAsUTF8(argv[1], &stringLength, &channelID) == FRE_OK)){
        channelIDString = [NSString stringWithUTF8String:(char*)channelID];
    }
    
    if(argv[2] && (FREGetObjectAsBool(argv[2], isDebug) == FRE_OK)){
        if(isDebug)
        {
            [MobClick setLogEnabled:YES];
        }
    }
    [MobClick setAppVersion:XcodeAppVersion];
    [MobClick startWithAppkey:appKeyString reportPolicy:(ReportPolicy) REALTIME channelId:channelIDString];
    [MobClick updateOnlineConfig];
    
    NSLog(@"Called Init Function Finished In UMeng, AppKey: %@ ChannelID: %@", appKeyString, channelIDString);
    
    return nil;
}

FREObject getUDID(FREContext context, void* funcData, uint32_t argc, FREObject argv[]){
    NSString* openUDID = [OpenUDID value];
    NSLog(@"UDID2: %@", openUDID);
    FREObject udid = nil;
    const char *str = [openUDID UTF8String];
    FRENewObjectFromUTF8(strlen(str)+1, (const uint8_t*)str, &udid);
    return udid;
}

ANE_FUNCTION(onEvent){
    NSLog(@"Called onEvent Function");
    NSString *eventIDString = getStringFromFREObject(argv[0]);
    NSString *labelIDString = getStringFromFREObject(argv[1]);
    
    if (labelIDString != NULL)
    {
        [MobClick event:eventIDString label:labelIDString];
    }
    else
    {
        [MobClick event:eventIDString];
    }
    
    NSLog(@"Called onEvent Function OK");
    
    return nil;
}

ANE_FUNCTION(onEventBegin)
{
    NSString *eventIDString = getStringFromFREObject(argv[0]);
    NSString *labelIDString = getStringFromFREObject(argv[1]);
    
    if (eventIDString != NULL)
    {
        [MobClick beginEvent:eventIDString label:labelIDString];
    }
    return nil;
}

ANE_FUNCTION(onEventEnd)
{
    NSString *eventIDString = getStringFromFREObject(argv[0]);
    NSString *labelIDString = getStringFromFREObject(argv[1]);
    
    if (eventIDString != NULL)
    {
        [MobClick endEvent:eventIDString label:labelIDString];
    }
    return nil;
}

ANE_FUNCTION(onPageBegin)
{
    NSString *page = getStringFromFREObject(argv[0]);
    
    if (page != NULL)
    {
        [MobClick beginLogPageView:page];
    }
    return nil;
}

ANE_FUNCTION(onPageEnd)
{
    NSString *page = getStringFromFREObject(argv[0]);
    
    if (page != NULL)
    {
        [MobClick endLogPageView:page];
    }
    return nil;
}

NSString* getStringFromFREObject(FREObject obj)
{
    uint32_t length;
    const uint8_t *value;
    FREGetObjectAsUTF8(obj, &length, &value);
    return [NSString stringWithUTF8String:(const char *)value];
}

void UMengContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest,
                             const FRENamedFunction** functionsToSet){
    
    static FRENamedFunction func[] =
    {
        MAP_FUNCTION(startAnaly, NULL),
        MAP_FUNCTION(onEvent, NULL),
        MAP_FUNCTION(onEventBegin, NULL),
        MAP_FUNCTION(onEventEnd, NULL),
        MAP_FUNCTION(onPageBegin, NULL),
        MAP_FUNCTION(onPageEnd, NULL),
        MAP_FUNCTION(getUDID, NULL),
        MAP_FUNCTION(onPause, NULL),
        MAP_FUNCTION(onResume, NULL),
        
    };
    
    *numFunctionsToTest = sizeof(func) / sizeof(FRENamedFunction);
    *functionsToSet = func;
    
    NSLog(@"Inited");
}

void UMengExtFinalizer(void* extData)
{
    NSLog(@"Finalize!");
    return;
}

void UMengExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &UMengContextInitializer;
    *ctxFinalizerToSet = &UMengExtFinalizer;
}
