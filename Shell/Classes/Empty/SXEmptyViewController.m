//
//  SXEmptyViewController.m
//  SXNews
//
//  Created by wangshiyu13 on 2017/1/31.
//  Copyright © 2017年 ShangxianDante. All rights reserved.
//

#import "SXEmptyViewController.h"

@interface SXEmptyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@end

@implementation SXEmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backImageView.image = [UIImage imageNamed:self.imageName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
