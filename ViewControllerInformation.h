//
//  ViewControllerInformation.h
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerInformation : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *lblDescription;
@property (nonatomic, weak) IBOutlet UILabel *lblPrice;
@property (nonatomic, weak) IBOutlet UILabel *lblCalorieCount;
@property (nonatomic, weak) IBOutlet UILabel *lblFat;
@property (nonatomic, weak) IBOutlet UILabel *lblSugar;
@property (nonatomic, weak) IBOutlet UILabel *lblSalt;
@property (nonatomic, weak) IBOutlet UILabel *lblLocation;
@property (nonatomic, weak) IBOutlet UIImageView *ivProductImageDetail;

@property (nonatomic, strong) NSMutableDictionary *dProductDetail;

@property (nonatomic , weak ) IBOutlet UILabel *valueLabel;
@property (nonatomic , weak ) IBOutlet UIStepper *stepper;

- ( IBAction)stepperValueChanged:( UIStepper *)sender;
- ( IBAction) BtnFitBit;

@property (nonatomic, weak) IBOutlet UIView         *vProduct;

@end
