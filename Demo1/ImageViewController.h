//
//  ImageViewController.h
//  Demo1
//
//  Created by shen on 2019/4/13.
//  Copyright © 2019年 shen. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property(nonatomic,strong) NSString *imageName;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressView;

@end

