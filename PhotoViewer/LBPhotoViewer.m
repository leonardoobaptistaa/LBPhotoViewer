//
//  LBPhotoViewer.m
//  PhotoViewer
//
//  Created by Leonardo Baptista on 8/6/12.
//  Copyright (c) 2012 Leonardo Baptista. All rights reserved.
//

#import "LBPhotoViewer.h"

@interface LBPhotoViewer()

@property (nonatomic, strong) UIImageView *imgForeground;
@property (nonatomic, strong) UIImageView *imgBackground;

@property (nonatomic, weak) id<LBPhotoViewerDataSource> _dataSource;

@property (nonatomic, assign) NSInteger numberOfImages;
@property (nonatomic, assign) NSInteger indexOfShowingImage;

@end

@implementation LBPhotoViewer

@synthesize imgForeground;
@synthesize imgBackground;

@synthesize effectDuration;
@synthesize timeToShowNext;
@synthesize _dataSource;

@synthesize numberOfImages;
@synthesize indexOfShowingImage;

@synthesize contentMode;


-(id<LBPhotoViewerDataSource>) dataSource {
  
  return self._dataSource;
}

-(void) setDataSource:(id<LBPhotoViewerDataSource>)dataSource {
  
  self._dataSource = dataSource;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
  
  self = [super initWithCoder:aDecoder];
  self.effectDuration = 1;
  self.timeToShowNext = 2;
  self.contentMode = UIViewContentModeScaleAspectFit;
  
  return self;
}

-(id) initWithFrame:(CGRect)frame {
  
  self = [super initWithFrame:frame];
  
  self.effectDuration = 1;
  self.timeToShowNext = 2;
  self.contentMode = UIViewContentModeScaleAspectFit;
  
  return self;
}

-(void) layoutSubviews {
  
  if (self.imgForeground != nil) {
    return;
  }
  
  self.imgForeground = [[UIImageView alloc] initWithFrame:self.frame];
  self.imgForeground.backgroundColor = [UIColor clearColor];
  self.imgForeground.contentMode = self.contentMode;
  
  self.imgBackground = [[UIImageView alloc] initWithFrame:self.frame];
  self.imgBackground.backgroundColor = [UIColor clearColor];
  self.imgBackground.contentMode = self.contentMode;
  
  self.imgBackground.alpha = 0;
  
  [self addSubview:self.imgBackground];
  [self addSubview:self.imgForeground];
  
  if (self.dataSource != nil) {
    
    [self reloadData];
  }
}


-(NSInteger) getNextImageIndex {
  
  return (self.indexOfShowingImage + 1) % numberOfImages;
}

-(NSInteger) getPreviousImageIndex {
  
  NSInteger newIndex = self.indexOfShowingImage - 1;
  if (newIndex < 0) {
    newIndex = self.numberOfImages- 1;
  }
  
  return newIndex;
}

-(void) animateNextImage {
  
  NSInteger nextIndex = [self getNextImageIndex];
  
  [UIView animateWithDuration:self.effectDuration delay:self.timeToShowNext options:UIViewAnimationOptionCurveEaseIn animations:^{
    
    self.imgForeground.alpha = 0;
    self.imgBackground.alpha = 1;
    
  } completion:^(BOOL finished) {
    
    self.imgForeground.alpha = 1;
    self.imgBackground.alpha = 0;
    
    self.imgForeground.image = [self.dataSource photoViewer:self imageForIndex:self.indexOfShowingImage];
    self.imgBackground.image = [self.dataSource photoViewer:self imageForIndex:nextIndex];
    
    self.indexOfShowingImage = nextIndex;
    
    if (self.effectDuration > 0) {
      
      [self performSelector:@selector(animateNextImage) withObject:nil afterDelay:self.timeToShowNext];
    }
    
  }];
  
}

-(void) animateFirstImage {
  
  NSInteger previousIndex = [self getPreviousImageIndex];
  
  if (self.numberOfImages == 1) {
    
    self.imgForeground.image = [self.dataSource photoViewer:self imageForIndex:previousIndex];
    return;
  }
  
  self.imgForeground.image = [self.dataSource photoViewer:self imageForIndex:previousIndex];
  self.imgBackground.image = [self.dataSource photoViewer:self imageForIndex:self.indexOfShowingImage];
  
  [self performSelector:@selector(animateNextImage) withObject:nil afterDelay:self.timeToShowNext];
}

-(void) reloadData {
  
  self.numberOfImages = [self.dataSource numberOfPhotosForViewer:self];
  self.indexOfShowingImage = 1;
  [self animateFirstImage];
}




@end
