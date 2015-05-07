//
//  ViewControllerFood.h
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerFood : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UISegmentedControl *uscFoodType;


@property (nonatomic, weak) IBOutlet UITableView *tvFood;
@property (nonatomic, weak) IBOutlet UITableView *tvDrink;
@property (nonatomic, weak) IBOutlet UITableView *tvSnack;

@property (nonatomic, strong)          NSMutableArray *marFood;
@property (nonatomic, strong)          NSMutableArray *marDrink;
@property (nonatomic, strong)          NSMutableArray *marSnack;
@property (nonatomic, strong)          NSMutableArray *marFoodList;


- (IBAction) scFoodType;

@end
