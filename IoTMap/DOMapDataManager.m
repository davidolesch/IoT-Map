#import "DOMapDataManager.h"

@interface DOMapDataManager ()

@property (strong, nonatomic) DOMapDataWebService *mapDataWebService;
@property (nonatomic, readwrite) NSArray *mapDataFeatures;

@end

@implementation DOMapDataManager

- (instancetype)initWithMapDataWebService:(DOMapDataWebService *)mapDataWebService {
    if (self = [super init]) {
        _mapDataWebService = mapDataWebService;
    }
    return self;
}

- (void)fetchMapDataFeaturesIfNeededWithCompletion:(void (^)(NSArray *mapDataFeatures))completion {
    [self.mapDataWebService fetchMapDataFeaturesWithCompletion:^(NSArray *mapDataFeatures) {
        self.mapDataFeatures = mapDataFeatures;
        if (completion) {
            completion(mapDataFeatures);
        }
    }];
}

@end
