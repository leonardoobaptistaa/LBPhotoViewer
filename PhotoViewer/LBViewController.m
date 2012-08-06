//
//  LBViewController.m
//  PhotoViewer
//
//  Created by Leonardo Baptista on 8/6/12.
//  Copyright (c) 2012 Leonardo Baptista. All rights reserved.
//

#import "LBViewController.h"

@interface LBViewController ()

@end

@implementation LBViewController

#pragma mark - LBPhotoViewerDataSource

-(NSInteger) numberOfPhotosForViewer:(LBPhotoViewer *)photoViewer {
  
  return 4;
}

-(UIImage *) photoViewer:(LBPhotoViewer *)photoViewer imageForIndex:(NSInteger)index {
  
  
  return [UIImage imageNamed: [NSString stringWithFormat:@"image0%d.jpg",index] ];
  
}

#pragma mark - UIView Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LBPhotoViewer *photoViewer = [[LBPhotoViewer alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    photoViewer.effectDuration = 1;
    photoViewer.timeToShowNext = 2;
    photoViewer.contentMode = UIViewContentModeScaleAspectFill;
    photoViewer.dataSource = self;
    [self.view addSubview:photoViewer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
