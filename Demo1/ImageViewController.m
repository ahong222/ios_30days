//
//  ImageViewController.m
//  Demo1
//
//  Created by shen on 2019/4/13.
//  Copyright © 2019年 shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageViewController.h"

@interface ImageViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) UIImageView *iconView;

@end

@implementation ImageViewController



- (void)viewDidLoad {
    NSLog(@"imageName is %@", _imageName);
    
    UIImage *image = [UIImage imageNamed:self.imageName];
    self.imageView.image = image;
    
    if(!self.iconView) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width/4, image.size.height/4)];
    }
    self.iconView.image = image;
    self.iconView.backgroundColor = UIColor.blueColor;
    self.scrollView.contentSize = CGSizeMake(image.size.width/4, image.size.height/4);
    [self.scrollView addSubview:self.iconView];
    
    //按住option后可以在模拟器上缩放
    self.scrollView.minimumZoomScale = 0.3;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.delegate = self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.iconView;
}
@end

