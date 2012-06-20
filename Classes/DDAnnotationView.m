//
//  DDAnnotationView.m
//  MapKitDragAndDrop

#import "DDAnnotationView.h"
#import "Annotation.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

CGContextRef CreateBitmapContext (int pixelsWide, int pixelsHigh)
{
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
	
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
	
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
	
    colorSpace = CGColorSpaceCreateDeviceRGB();
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        return NULL;
    }
    context = CGBitmapContextCreate (bitmapData,
									 pixelsWide,
									 pixelsHigh,
									 8,      // bits per component
									 bitmapBytesPerRow,
									 colorSpace,
									 kCGImageAlphaPremultipliedLast);
    if (context== NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
        return NULL;
    }
    CGColorSpaceRelease( colorSpace );
	
    return context;
}

void drawText (CGContextRef myContext, NSString *text, int charnum, CGSize labelSize)
{	
	CGContextSetAllowsAntialiasing(myContext, YES);
    CGContextSelectFont (myContext,
						 "Helvetica",
						 12,
						 kCGEncodingMacRoman);
    CGContextSetCharacterSpacing (myContext, 1);
	
	CGContextSetRGBFillColor(myContext,0.77,0.59,0,1);
	//CGContextSetRGBStrokeColor(myContext, 0, 0, 1, 1);
	CGContextFillRect(myContext,CGRectMake(0,0,labelSize.width,labelSize.height));
	
    CGContextSetTextDrawingMode (myContext, kCGTextFillClip);
    CGContextSetRGBFillColor (myContext, 1, 1, 1, 1);
    CGContextShowTextAtPoint (myContext, 2, 3, [text UTF8String], charnum);
}

@interface DDAnnotationView ()

@property (nonatomic, retain) UIImageView	*pinShadow;

@end

#pragma mark -
#pragma mark DDAnnotationView implementation

@implementation DDAnnotationView

@synthesize pinShadow = _pinShadow;
@synthesize mapView = _mapView;
@synthesize abbreviation = _abbreviation;

#pragma mark -
#pragma mark View boilerplate

- (id)initWithAnnotation:(id <MKAnnotation>)annotation 
		 reuseIdentifier:(NSString *)reuseIdentifier 
			abbreviation:(NSString*)abbreviation {
	
	if ((self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier])) {
		self.canShowCallout = YES;		
		self.abbreviation = [NSString stringWithString:abbreviation];
		
		CGSize labelSize = [abbreviation sizeWithFont:[UIFont fontWithName:@"Helvetica" size:12]];
		labelSize.width = labelSize.width + 5;
		CGContextRef myImageContext = CreateBitmapContext(labelSize.width,labelSize.height);
		drawText(myImageContext, abbreviation, [abbreviation length],labelSize);
		self.image = [UIImage imageWithCGImage:CGBitmapContextCreateImage(myImageContext)];
	}
	return self;
}

- (void)dealloc {
	[_pinShadow release];
	_pinShadow = nil;
	[_abbreviation release];
	_abbreviation = nil;
	
	[super dealloc];
}

@end
