//
//  FriendRequestViewController.h
//  PhotaCon-IOS
//
//  Created by Doug on 1/23/13.
//  Copyright (c) 2013 billionaire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface FriendRequestViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) NSURL *friendRequestURL;
@property (nonatomic, strong)NSMutableDictionary *fbDialogParam;
@property (nonatomic, strong) User *personToAdd;
@end
