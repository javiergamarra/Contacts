//
//  ContactsViewController.m
//  Contacts
//
//  Created by Jorge Maroto García on 01/05/11.
//  Copyright 2011 tactilApp.com. All rights reserved.
//

#import "ContactsViewController.h"

@implementation ContactsViewController
@synthesize nombre, apellido;

- (void)dealloc{
    [nombre release];
    [apellido release];
    
    [super dealloc];
}

-(void)mostrarPicker{
    NSLog(@"Muestra el picker");

    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentModalViewController:picker animated:YES];
    [picker release];
}



#pragma mark - ABPeoplePickerNavigationControllerDelegate
-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    NSString *name = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    self.nombre.text = name;
    
    NSString *apell = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    self.apellido.text = apell;
    
    [name release];
    [apell release];
    
//    [self dismissModalViewControllerAnimated:YES];
    
    return YES;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    if (property == kABPersonPhoneProperty){
        ABMultiValueRef phones =(NSString*)ABRecordCopyValue(person, kABPersonPhoneProperty);
        NSString* mobile = (NSString*)ABMultiValueCopyValueAtIndex(phones, identifier);
        NSLog(@"Teléfono elegido: %@", mobile);
        return YES;        
    }
    NSLog(@"Ye");
    return NO;   
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [self dismissModalViewControllerAnimated:YES];
}










- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)awakeFromNib{
    NSLog(@"Cargando");
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
