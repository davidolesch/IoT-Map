#import "MKPointAnnotation+Blocks.h"
#import <objc/runtime.h>

static const void *MKPointAnnotationBlockKey = &MKPointAnnotationBlockKey;

@implementation MKPointAnnotation (Blocks)

- (MKPointAnnotationBlock)selectionBlock {
    return objc_getAssociatedObject(self, MKPointAnnotationBlockKey);
}

- (void)setSelectionBlock:(MKPointAnnotationBlock)selectionBlock {
    objc_setAssociatedObject(self, MKPointAnnotationBlockKey, selectionBlock, OBJC_ASSOCIATION_COPY);
}

@end
