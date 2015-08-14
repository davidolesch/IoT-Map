#import "AppDelegate.h"
#import "DOMapDataManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupApp];
    
    return YES;
}

- (void)setupApp {
    DOMapDataWebService *mapDataWebService = [[DOMapDataWebService alloc] init];
    self.mapDataManager = [[DOMapDataManager alloc] initWithMapDataWebService:mapDataWebService];
}

@end
