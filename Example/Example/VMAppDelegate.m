//
//  VMAppDelegate.m
//  Example
//
//  Created by Sun Peng on 14-7-10.
//  Copyright (c) 2014年 Void Main. All rights reserved.
//

#import "VMAppDelegate.h"
#import "VMBrushImageView.h"
#import "VMPreviewWindowController.h"

@implementation VMAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setAllowedFileTypes:@[@"public.image"]];
    [openPanel setCanChooseFiles:YES];
    [openPanel setCanChooseDirectories:NO];
    if ([openPanel runModal] == NSOKButton) {
        NSURL *imageURL = [openPanel URL];
        [self.brushImageView setRawImage:[[NSImage alloc] initWithContentsOfURL:imageURL]];
        [self.window makeKeyAndOrderFront:nil];
    } else {
        [NSApp terminate:nil];
    }
}

- (IBAction)increaseBrushSize:(id)sender {
    [self.brushImageView increaseBrushRadius:2];
}

- (IBAction)decreaseBrushSize:(id)sender {
    [self.brushImageView decreaseBrushRadius:2];
}

- (IBAction)changeBrushType:(id)sender {
    [self.brushImageView setBrushType:[sender tag]];
}

- (IBAction)resetMask:(id)sender {
    [self.brushImageView resetMask];
}

- (IBAction)viewResult:(id)sender {
    self.previewWindowController = nil;
    self.previewWindowController = [[VMPreviewWindowController alloc] initWithImage:self.brushImageView.image mask:self.brushImageView.outMask];
    [self.previewWindowController showWindow:nil];
    [self.previewWindowController.window makeKeyAndOrderFront:nil];
}

@end
