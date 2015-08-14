
#import <MapKit/MapKit.h>

typedef void (^MKPointAnnotationBlock)();

@interface MKPointAnnotation (Blocks)

@property (nonatomic, copy) MKPointAnnotationBlock selectionBlock;

@end
