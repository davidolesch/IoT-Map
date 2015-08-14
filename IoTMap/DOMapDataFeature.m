#import "DOMapDataFeature.h"

@implementation DOMapDataFeature

- (instancetype)initWithLongitude:(NSNumber *)longitude latitude:(NSNumber *)latitude title:(NSString *)title descriptionHTML:(NSString *)descriptionHTML {
    if (self = [super init]) {
        _latitude = latitude;
        _longitude = longitude;
        _title = title;
        _descriptionHTML = descriptionHTML;
    }
    return self;
}

@end
