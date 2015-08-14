#import "DOMapDataViewController.h"
#import "DOMapDataManager.h"
#import "AppDelegate.h"
#import "DOMapDataFeature.h"
#import <MapKit/MapKit.h>
#import "MKPointAnnotation+Blocks.h"

@interface DOMapDataViewController () <MKMapViewDelegate>

@property (strong, nonatomic) DOMapDataManager *mapDataManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *annotationDescriptionWebView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *__annotationDescriptionWebViewHeight;

@end

@implementation DOMapDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapDataManager = [(AppDelegate *)[UIApplication sharedApplication].delegate mapDataManager];
    NSAssert(self.mapDataManager, @"DOMapDataViewController requires a DOMapDataManager before loading its view.");
    [self.mapDataManager fetchMapDataFeaturesIfNeededWithCompletion:^(NSArray *mapDataFeatures) {
        [self showMapDataFeatures:mapDataFeatures];
    }];
}

- (void)showMapDataFeatures:(NSArray *)mapDataFeatures {
    for (DOMapDataFeature *mapDataFeature in mapDataFeatures) {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:CLLocationCoordinate2DMake([mapDataFeature.latitude doubleValue], [mapDataFeature.longitude doubleValue])]    ;
        annotation.title = mapDataFeature.title;
        annotation.selectionBlock = ^{
            [self.annotationDescriptionWebView loadHTMLString:mapDataFeature.descriptionHTML baseURL:nil];
        };
        [self.mapView addAnnotation:annotation];
    }
    [self.mapView showAnnotations:self.mapView.annotations animated:YES];
}

#pragma mark setters

- (void)setMapDataManager:(DOMapDataManager *)mapDataManager {
    _mapDataManager = mapDataManager;
}

#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    MKPointAnnotation *pointAnnotation = [view annotation];
    if (pointAnnotation.selectionBlock) {
        pointAnnotation.selectionBlock();
    }
    self.__annotationDescriptionWebViewHeight.constant = 177.f;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    self.__annotationDescriptionWebViewHeight.constant = 0.f;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
