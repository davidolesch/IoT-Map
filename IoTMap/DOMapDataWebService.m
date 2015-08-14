#import "DOMapDataWebService.h"
#import "DOMapDataFeature.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

#define kMapDataFeaturesEndpoint @"https://www.praetorian.com/iotmap/data/db-zones.geojson"

@interface DOMapDataWebService ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

@end

@implementation DOMapDataWebService

- (void)fetchMapDataFeaturesWithCompletion:(void (^)(NSArray *mapDataFeatures))completion {
    if (!self.manager) {
        self.manager = [AFHTTPRequestOperationManager manager];
        self.manager.responseSerializer.acceptableContentTypes = [self.manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObject:@"text/plain"]];
    }
    [self.manager GET:kMapDataFeaturesEndpoint parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseDictionary) {
        if (completion) {
            NSArray *featureDictionaries = responseDictionary[@"features"];
            NSMutableArray *mapDataFeatures = [NSMutableArray array];
            for (NSDictionary *featureDictionary in featureDictionaries) {
                NSNumber *longitude = featureDictionary[@"geometry"][@"coordinates"][0];
                NSNumber *latitude = featureDictionary[@"geometry"][@"coordinates"][1];
                NSString *title = ^{
                    NSString *untrimmedTitle = featureDictionary[@"properties"][@"title"];
                    return [untrimmedTitle componentsSeparatedByString:@"<"].firstObject;
                }();
                NSString *descriptionHTML = featureDictionary[@"properties"][@"description"];
                DOMapDataFeature *mapDataFeature = [[DOMapDataFeature alloc] initWithLongitude:longitude latitude:latitude title:title descriptionHTML:descriptionHTML];
                [mapDataFeatures addObject:mapDataFeature];
            }
            completion(mapDataFeatures.copy);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
