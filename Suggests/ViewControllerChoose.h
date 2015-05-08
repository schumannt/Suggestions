//
//  ViewControllerChoose.h
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerChoose : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


@property (nonatomic, weak) IBOutlet UILabel *lblRemaining;
@property (nonatomic, weak) IBOutlet UILabel *lblBurnt;

@property (nonatomic, strong) NSMutableArray *marMeal;
@property (nonatomic, strong) NSMutableArray *marType;
@property (nonatomic, strong) NSMutableArray *marCost;
@property (nonatomic) NSInteger *firstComponentRow;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UILabel *lblMealChoice;
@property (strong, nonatomic) IBOutlet UILabel *lblTypeChoice;
@property (strong, nonatomic) IBOutlet UILabel *lblCostChoice;

@end
