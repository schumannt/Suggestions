//
//  ViewControllerChoose.m
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import "ViewControllerChoose.h"

@interface ViewControllerChoose ()

{
    NSArray *_pickerData;
}

@end

@implementation ViewControllerChoose

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize Data
    
#pragma mark -
#pragma mark Picker code
    
    
    // Initialize Data
    _pickerData = @[ @[@"Breakfast", @"Lunch", @"Snacks", @"Dinner"],
                     @[@"Healthy", @"Naughty", @"Healthy", @"Naughty", ],
                     //@[@"!", @"#", @"$", @"%"],
                     @[@"£", @"££", @"£££", @"s"] ];
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) BtnSelect {
    
}

#pragma mark -
#pragma mark Picker code

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[component][row];
}


// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

@end
