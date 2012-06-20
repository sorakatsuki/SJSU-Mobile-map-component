//
//  DDAnnotationView.h
//  MapKitDragAndDrop

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DDAnnotationView : MKAnnotationView {

@private
    UIImageView *		_pinShadow;
    MKMapView *			_mapView;
	NSString *_abbreviation;
}

@property (nonatomic, assign) MKMapView *			mapView;
@property (nonatomic, retain) NSString *abbreviation;

- (id)initWithAnnotation:(id <MKAnnotation>)annotation 
		 reuseIdentifier:(NSString *)reuseIdentifier 
			abbreviation:(NSString*)abbreviation;

@end
