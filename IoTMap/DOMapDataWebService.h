#import <Foundation/Foundation.h>

@interface DOMapDataWebService : NSObject

- (void)fetchMapDataFeaturesWithCompletion:(void (^)(NSArray *mapDataFeatures))completion;

@end
