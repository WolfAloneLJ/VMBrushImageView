//
//  VMAppDelegate.m
//  Example
//
//  Created by Sun Peng on 14-7-10.
//  Copyright (c) 2014年 Void Main. All rights reserved.
//

#import "VMAppDelegate.h"
#import "VMBrushImageView.h"

@implementation VMAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setAllowedFileTypes:@[@"public.image"]];
    [openPanel setCanChooseFiles:YES];
    [openPanel setCanChooseDirectories:NO];
    if ([openPanel runModal] == NSOKButton) {
        NSURL *imageURL = [openPanel URL];
        [self.brushImageView setImage:[[NSImage alloc] initWithContentsOfURL:imageURL]];
        [self.window makeKeyAndOrderFront:nil];
    } else {
        [NSApp terminate:nil];
    }
}

@end