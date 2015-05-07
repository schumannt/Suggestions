//
//  ViewControllerChoose.m
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import "ViewControllerChoose.h"

@interface ViewControllerChoose ()

@end

@implementation ViewControllerChoose

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize Data
    
    self.marMeal = [[NSMutableArray alloc] init];
    [self.marMeal addObject:@"Breakfast"];
    [self.marMeal addObject:@"Lunch"];
    [self.marMeal addObject:@"Snacks"];
    [self.marMeal addObject:@"Dinner"];
    
    self.marType = [[NSMutableArray alloc] init];
    [self.marType addObject:@"Healthy"];
    [self.marType addObject:@"Naughty"];
    
    self.marCost = [[NSMutableArray alloc] init];
    [self.marCost addObject:@"£"];
    [self.marCost addObject:@"££"];
    [self.marCost addObject:@"£££"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //Three columns
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    if(component== 0)
    {
        return [self.marMeal count];
    }
    if(component== 1)
    {
        return [self.marType count];
    }
    else
    {
        return [self.marCost count];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Selected Row %ld", (long)row);
    
    NSInteger firstComponentRow = [self.picker selectedRowInComponent:0];
    NSInteger secondComponentRow = [self.picker selectedRowInComponent:1];
    NSInteger thirdComponentRow = [self.picker selectedRowInComponent:2];
    
    switch(firstComponentRow)
    {
        case 0:
            self.lblMealChoice.text = @"Breakfast";
            break;
        case 1:
            self.lblMealChoice.text = @"Lunch";
            break;
        case 2:
            self.lblMealChoice.text = @"Snacks";
            break;
        case 3:
            self.lblMealChoice.text = @"Dinner";
            break;
    }
    
    switch(secondComponentRow) {
        case 0:
            self.lblTypeChoice.text = @"Healthy";
            break;
        case 1:
            self.lblTypeChoice.text = @"Naughty";
            break;
    }
    
    switch(thirdComponentRow){
        case 0:
            self.lblCostChoice.text = @"£";
            break;
        case 1:
            self.lblCostChoice.text = @"££";
            break;
        case 2:
            self.lblCostChoice.text = @"£££";
            break;
    }
}

- (IBAction) BtnSelect {
    
}


@end
