#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

//
// This controller demonstrates how to use SMCalloutView with MKMapView. It is a bit more complex
// than using SMCalloutView with a simple UIScrollView. We need to subclass MKMapView in order
// to provide all our features such as allowing touches on our callout.
//

@interface MapKitController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapKitWithUICalloutView;
@property (nonatomic, strong) MKPointAnnotation *annotationForUICalloutView;

@end
