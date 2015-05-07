//
//  ViewControllerChoose.h
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerChoose : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction) BtnSelect;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

//@property (nonatomic, strong)          NSMutableArray *marName;

@end
