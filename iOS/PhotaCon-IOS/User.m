//
//  User.m
//  PhotaCon-IOS
//
//  Created by Doug on 1/19/13.
//  Copyright (c) 2013 billionaire. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name = _name;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize email = _email;
@synthesize applications = _applications;
@synthesize friendRelation = _friendRelation;


/*
+ (id) initWithName:(NSString *)name
{
    User *user = [[self alloc] init];
    [user setName:name];
    return user;
}
 */

+(User *) initWithDict:(NSDictionary *)dict{
    User *user = [[self alloc] init];
    
    [user setFirstName:[dict objectForKey:@"firstName"]];
    [user setLastName:[dict objectForKey:@"lastName"]];
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    [user setName: fullName];
    [user setEmail:[dict objectForKey:@"email"]];
    [user setApplications:[dict objectForKey:@"accounts"]];
    
    return user;
}

-(NSString *) getAppID:(NSString *)appName{
    for (NSDictionary *app in self.applications) {
        if([[app objectForKey:@"plugin"] isEqual:appName])
        {
            return [app objectForKey:@"pluginId"];
        }
    }
    return nil;
}
@end
