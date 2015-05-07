//
//  TableViewCellFood.h
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerFood.h"

@interface TableViewCellFood : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *lblProductName;
@property (nonatomic, weak) IBOutlet UILabel *lblProductPrice;
@property (nonatomic, weak) IBOutlet UILabel *lblProductKcal;
@property (nonatomic, weak) IBOutlet UIImageView *ivProductImage;
@property (nonatomic, weak) IBOutlet UIImageView *ivTickBox;

@end
