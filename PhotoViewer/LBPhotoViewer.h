//
//  LBPhotoViewer.h
//  PhotoViewer
//
//  Created by Leonardo Baptista on 8/6/12.
//  Copyright (c) 2012 Leonardo Baptista. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LBPhotoViewer;
@protocol LBPhotoViewerDataSource <NSObject>

- (NSInteger)numberOfPhotosForViewer: (LBPhotoViewer *)photoViewer;

- (UIImage *)photoViewer:(LBPhotoViewer *)photoViewer imageForIndex:(NSInteger)index;

@end

@interface LBPhotoViewer : UIView<UITableViewDataSource>

@property (assign, nonatomic) float effectDuration;
@property (assign, nonatomic) float timeToShowNext;

@property (weak, nonatomic) id<LBPhotoViewerDataSource> dataSource;
@property (assign, nonatomic) UIViewContentMode contentMode;

-(void) animateNextImage;
-(void) reloadData;

@end
