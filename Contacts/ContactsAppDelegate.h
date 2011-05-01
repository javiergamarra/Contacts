//
//  ContactsAppDelegate.h
//  Contacts
//
//  Created by Jorge Maroto García on 01/05/11.
//  Copyright 2011 tactilApp.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactsViewController;

@interface ContactsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ContactsViewController *viewController;

@end
