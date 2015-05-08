//
//  ViewController.m
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import "ViewControllerSignIn.h"

@interface ViewControllerSignIn ()

@end

@implementation ViewControllerSignIn

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction) BtnSignIn {
    ViewControllerChoose *vcChoose = [[[ViewControllerChoose alloc] initWithNibName:nil bundle:nil]];
    [self pres]
}
*/

- (IBAction) BtnSignIn {
    [ self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction) BtnSignUp {
    
}

@end
