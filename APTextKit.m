//
//  APTextKit.m
//  Test
//
//  Created by Alberto Pasca on 22/10/13.
//  Copyright (c) 2013 albertopasca.it. All rights reserved.
//

#import "APTextKit.h"

@implementation APTextKit

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		[NSTimer scheduledTimerWithTimeInterval:0.5
																		 target:self
																	 selector:@selector(drawText)
																	 userInfo:nil
																		repeats:NO];
	}

	return self;
}

- (void)drawRect:(CGRect)dirtyRect
{
  CGRect bounds = self.bounds;
  
  if ( bounds.size.width == 0 || bounds.size.height == 0 ) return;
  
  CGContextRef  context = UIGraphicsGetCurrentContext();
  
  CGContextClearRect(context, dirtyRect );
	
  CGRect rect  = bounds;
  CGPoint top  = CGPointMake( rect.size.width / 2.0, 0 );
  CGPoint bott = CGPointMake( top.x, rect.size.height );
  
  rect.size.width *= exp( - rect.size.height * 0.01 );
  rect.origin.x = ( bounds.size.width - rect.size.width ) / 2.0;
  
  CGPoint left = CGPointMake( rect.origin.x, rect.size.height / 2.0 );
  CGPoint right = CGPointMake( rect.origin.x + rect.size.width, left.y );
	
  UIBezierPath *  path = [ UIBezierPath bezierPath ];
  
  [ path moveToPoint: top ];
  [ path addLineToPoint: left ];
  [ path addLineToPoint: bott ];
  [ path addLineToPoint: right ];
  [ path closePath ];
	
  [[ UIColor colorWithWhite: 0.95 alpha: 1.0 ] setFill ];
  [ path fill ];
  [[ UIColor colorWithWhite: 0.9 alpha: 1.0 ] setStroke ];
  [ path stroke ];
}



- ( void ) drawText
{
	self.myTextView.hidden = YES;
	return;
	
	

	self.myTextView.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
	
	UIBezierPath *circle		=	 [ UIBezierPath bezierPathWithOvalInRect: CGRectMake(105, 100, 120, 110) ];

	UIImageView *imageView	=  [[ UIImageView alloc] initWithFrame:			CGRectMake(110, 110, 100, 102) ];
	[imageView setImage: [UIImage imageNamed: @"ship.png"]];
	[imageView setContentMode:UIViewContentModeScaleToFill];

	[self.myTextView addSubview: imageView];

	self.myTextView.textContainer.exclusionPaths = @[circle];
}


@end
