#import <Foundation/Foundation.h>
#import "DOMapDataWebService.h"

@interface DOMapDataManager : NSObject

@property (nonatomic, readonly) NSArray *mapDataFeatures;

- (instancetype)initWithMapDataWebService:(DOMapDataWebService *)mapDataWebService;
- (void)fetchMapDataFeaturesIfNeededWithCompletion:(void (^)(NSArray *mapDataFeatures))completion;

@end
