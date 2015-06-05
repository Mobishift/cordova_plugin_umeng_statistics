/********* UMengStatistics.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

#import "MobClick.h"

static BOOL isInit = false;

@interface UMengStatistics : CDVPlugin {
  // Member variables go here.
}

- (void)pageStart:(CDVInvokedUrlCommand*)command;
- (void)pageEnd:(CDVInvokedUrlCommand*)command;
- (void)pageEvent:(CDVInvokedUrlCommand*)command;
@end

@implementation UMengStatistics

- (void)initMobClick{
    if(!isInit){
        isInit = true;
        CDVViewController* viewController = (CDVViewController*)self.viewController;
        NSString* umengAppKey = [viewController.settings objectForKey:@"umengappkey"];
        [MobClick startWithAppkey:umengAppKey reportPolicy:SEND_INTERVAL channelId:@"appstore"];
    }
}

- (void)pageStart:(CDVInvokedUrlCommand*)command
{
    [self initMobClick];
    NSString* pageName = [command.arguments objectAtIndex:0];
    [MobClick beginLogPageView:pageName];
}

- (void)pageEnd:(CDVInvokedUrlCommand*)command
{
    [self initMobClick];
    NSString* pageName = [command.arguments objectAtIndex:0];
    [MobClick endLogPageView:pageName];
}

-(void)pageEvent:(CDVInvokedUrlCommand*)command
{
    [self initMobClick];
    NSString* eventId = [command.arguments objectAtIndex:0];
    [MobClick event:eventId];
}

@end
