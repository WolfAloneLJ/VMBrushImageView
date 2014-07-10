//
//  VMBrushImageView.h
//  Example
//
//  Created by Sun Peng on 14-7-10.
//  Copyright (c) 2014年 Void Main. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum : NSUInteger {
    Foreground,
    Background,
    Eraser,
} BrushType;

@interface VMBrushImageView : NSImageView {
    NSImage *_rawImage;
    NSImage *_maskImage;

    NSCursor *_brushCursor;

    CGPoint _lastPoint;
}

@property float brushRadius;
@property BrushType brushType;

- (void)setImage:(NSImage *)image;

@end