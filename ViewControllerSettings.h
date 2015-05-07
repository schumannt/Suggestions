//
//  ViewControllerSettings.h
//  Suggests
//
//  Created by Victoria Sainter on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerSettings : UIViewController <UITableViewDataSource, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tvSettings;
@property (nonatomic, strong) NSMutableArray *marSettings;


@end