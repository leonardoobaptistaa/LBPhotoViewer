//
//  LBViewController.m
//  PhotoViewer
//
//  Created by Leonardo Baptista on 8/6/12.
//  Copyright (c) 2012 Leonardo Baptista. All rights reserved.
//

#import "LBViewController.h"

@interface LBViewController ()

@property (strong, nonatomic) IBOutlet LBPhotoViewer *photoViwer;

@end

@implementation LBViewController
@synthesize photoViwer;

#pragma mark - LBPhotoControllerDataSource

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
    
    self.photoViwer = [[LBPhotoViewer alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    self.photoViwer.contentMode = UIViewContentModeScaleAspectFill;
    self.photoViwer.dataSource = self;
  
  [self.view addSubview:self.photoViwer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
