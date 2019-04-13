//
//  ViewController.m
//  Demo1
//
//  Created by shen on 2019/4/3.
//  Copyright © 2019年 shen. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepareForSegue");
    if([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController *viewController = (ImageViewController*)segue.destinationViewController;
        viewController.imageName= segue.identifier;
        viewController.title = segue.identifier;
        
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"不支持的跳转" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"clicked alert action");
        }]];
        [self presentViewController:alert animated:YES completion:^(){
            NSLog(@"controller showed");
        }];
    }
    
}

- (IBAction)customJump:(id)sender {
    NSLog(@"customJump");
    [self performSegueWithIdentifier:@"image_5" sender:sender];
}
@end
