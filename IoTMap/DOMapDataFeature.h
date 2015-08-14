#import <Foundation/Foundation.h>

@interface DOMapDataFeature : NSObject

@property (nonatomic, readonly) NSNumber *latitude;
@property (nonatomic, readonly) NSNumber *longitude;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *descriptionHTML;

- (instancetype)initWithLongitude:(NSNumber *)longitude latitude:(NSNumber *)latitude title:(NSString *)title descriptionHTML:(NSString *)descriptionHTML;

@end
