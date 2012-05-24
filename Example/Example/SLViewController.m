//
//  SLViewController.m
//  Example
//
//  Created by Aaron Brethorst on 5/24/12.
//  Copyright (c) 2012 Structlab LLC. All rights reserved.
//

#import "SLViewController.h"
#import "SYCache.h"
#import "SYCompositor.h"

@interface SLViewController ()

@end

@implementation SLViewController
@synthesize imageView = _imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self composite];
}

- (void)composite
{
    // Build your cache key to be unique per your layer configuration
    NSString *cacheKey = @"cache-key";
    
    // Get the image from SYCompositor
    UIImage *image = [SYCompositor imageWithKey:cacheKey];
    
    // If the image is `nil`, you should build it
    if (image == nil) {
        // Create your layers. See `SYCompositor.h` for a full list of available keys
        NSArray *layers = [[NSArray alloc] initWithObjects:
                           // Lens
                           [NSDictionary dictionaryWithObjectsAndKeys:
                            @"red.png", kSYCompositorImageNameKey,
                            [NSValue valueWithCGRect:CGRectMake(88.0f, 275.0f, 50.f, 50.f)], kSYCompositorRectKey,
                            nil],
                           
                           // Body layer
                           [NSDictionary dictionaryWithObjectsAndKeys:
                            @"green.png", kSYCompositorImageNameKey,
                            [NSValue valueWithCGRect:CGRectMake(108.0f, 295.0f, 138.0f, 138.0f)], kSYCompositorRectKey,
                            nil],
                           nil];
        
        // Create the image. This will store it in the cache automatically.
        image = [SYCompositor imageWithLayers:layers size:[[UIScreen mainScreen] bounds].size key:cacheKey];
    }
    
    // Now `image` is ready to go!
    self.imageView.image = image;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
