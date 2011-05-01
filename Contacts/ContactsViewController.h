//
//  ContactsViewController.h
//  Contacts
//
//  Created by Jorge Maroto García on 01/05/11.
//  Copyright 2011 tactilApp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ContactsViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>{
    UILabel *nombre;
    UILabel *apellido;
}

@property (nonatomic, retain) IBOutlet UILabel *nombre;
@property (nonatomic, retain) IBOutlet UILabel *apellido;

-(IBAction)mostrarPicker;

@end
