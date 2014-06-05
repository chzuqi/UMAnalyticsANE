//
//  UMeng.h
//  UMeng
//
//  Created by mani on 13-7-17.
//  Copyright (c) 2013年 pamakids. All rights reserved.
//

#ifndef UMeng_UMeng_h
#define UMeng_UMeng_h

#define ANE_FUNCTION(f) FREObject (f)(FREContext ctx, void *data, uint32_t argc, FREObject argv[])
#define MAP_FUNCTION(f, data) { (const uint8_t*)(#f), (data), &(f) }
#define DISPATCH_STATUS_EVENT(extensionContext, code, status) FREDispatchStatusEventAsync((extensionContext), (uint8_t*)code, (uint8_t*)status)

@interface UMeng : NSObject
{
    
}

@end
#endif

NSString* getStringFromFREObject(FREObject obj);
