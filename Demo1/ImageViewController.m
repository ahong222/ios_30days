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
    //http图片通过dataWithContentsOfURL 获取为null
    NSArray *array = @[@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png",
                      @"http://image.jonyjay.com/github/github02.png",
                      @"http://image.jonyjay.com/github/github03.jpg",
                      @"http://image.jonyjay.com/github/github04.jpg",
                      @"http://image.jonyjay.com/github/github05.jpg"];
    NSString *number =[self.imageName substringFromIndex:self.imageName.length-1];
    NSLog(@"number:%@", number);
    NSInteger index = [number integerValue];
    NSLog(@"index:%zd", index);
    
    NSString *urlPath = [array objectAtIndex:index-1];
    NSURL *url = [NSURL URLWithString:urlPath];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"request success");
        if(!error) {
            NSData *imageData = [NSData dataWithContentsOfFile:location];
            UIImage *image = [UIImage imageWithData:imageData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
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
                
                [self.progressView setHidden:YES];
            });
        } else {
            NSLog(@"request error:%@", error);
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:[NSString stringWithFormat:@"请求图片错误:%@",error] preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                 [self.progressView setHidden:YES];
            }]];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
    
    NSLog(@"request task");
    [task resume];
//    NSData *imageData = [NSData dataWithContentsOfURL:url];
//    NSLog(@"imageData url:%@,length:%zd", url, imageData.length);
//
//
//    UIImage *image = [UIImage imageWithData:imageData];
    
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.iconView;
}
@end

