//
//  photaHomeViewController.m
//  PhotaCon-IOS
//
//  Created by Doug on 1/5/13.
//  Copyright (c) 2013 billionaire. All rights reserved.
//

#import "photaHomeViewController.h"
#import "PhotaLoginManager.h"
@interface photaHomeViewController ()

@end

@implementation photaHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)logout{
    [[PhotaLoginManager sharedInstance] logout];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
