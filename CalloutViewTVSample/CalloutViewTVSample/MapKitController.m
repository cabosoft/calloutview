#import "MapKitController.h"


@implementation MapKitController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nil bundle:nil]) {
        
        self.title = @"MapKit";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
	}
	
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.annotationForUICalloutView = [MKPointAnnotation new];
    self.annotationForUICalloutView.coordinate = (CLLocationCoordinate2D){28.388154, -80.604200};
    self.annotationForUICalloutView.title = @"Cape Canaveral";
    self.annotationForUICalloutView.subtitle = @"Launchpad";

    self.mapKitWithUICalloutView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapKitWithUICalloutView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapKitWithUICalloutView.delegate = self;
    [self.mapKitWithUICalloutView addAnnotation:self.annotationForUICalloutView];
    [self.view addSubview:self.mapKitWithUICalloutView];
}

//
// MKMapView delegate methods
//

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    // create a proper annotation view, be lazy and don't use the reuse identifier
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@""];
    
    // create a disclosure button for map kit
    UIButton *disclosure = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [disclosure addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disclosureTapped)]];
    view.rightCalloutAccessoryView = disclosure;
    
	view.canShowCallout = YES;
    
    return view;
}

- (void)disclosureTapped {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tap!" message:@"You tapped the disclosure button."
//                                                   delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
//    [alert show];
}

@end

//
// Custom Map View
//
// We need to subclass MKMapView in order to present an SMCalloutView that contains interactive
// elements.
//

@interface MKMapView (UIGestureRecognizer)

// this tells the compiler that MKMapView actually implements this method
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;

@end
