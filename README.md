Photo Viewer
============

Do you need a photo viewer with dissolve effect that is easy to use and don't give your headaches using a lot of memory? You just found one!

How to install

1.	Clone this project
2.	Copy LBPhotoViewer.h and LBPhotoViewer.m to your project
3.	Import LBPhotoViewer in your header file (.h)
4.	Add the photo viewer to your view:
```objc
	LBPhotoViewer *photoViewer = [[LBPhotoViewer alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	photoViewer.effectDuration = 1;
	photoViewer.timeToShowNext = 2;
	photoViewer.contentMode = UIViewContentModeScaleAspectFill;
	photoViewer.dataSource = self;
	[self.view addSubview:photoViewer];
```
5.	Supply a dataSource:

```objc
-(NSInteger) numberOfPhotosForViewer:(LBPhotoViewer *)photoViewer {

	return 4;
}

-(UIImage *) photoViewer:(LBPhotoViewer *)photoViewer imageForIndex:(NSInteger)index {

	return [UIImage imageNamed: [NSString stringWithFormat:@"image0%d.jpg",index] ];  
}
```
		
That's it!
Any doubts check right in the demo code. Feel free to send a message and to contribute with.

Credits
-------------

Photos -> [Caacs Baptista photographer](https://www.facebook.com/media/set/?set=a.255250534496865.65286.100000357615433&type=3)