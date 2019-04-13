//
//  ImageViewController.m
//  Demo1
//
//  Created by shen on 2019/4/13.
//  Copyright © 2019年 shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController



- (void)viewDidLoad {
    NSLog(@"imageName is %@", _imageName);
    
    UIImage *image = [UIImage imageNamed:self.imageName];
    self.imageView.image = image;
}
@end

