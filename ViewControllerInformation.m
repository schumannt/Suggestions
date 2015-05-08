//
//  ViewControllerInformation.m
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import "ViewControllerInformation.h"

@interface ViewControllerInformation ()

@end

@implementation ViewControllerInformation

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"dictionary int he information paneeeeeee %@", self.dProductDetail);
    // Do any additional setup after loading the view.
    
    NSMutableDictionary *dProductDetailAfterSource = self.dProductDetail[@"_source"];
    //self.lblCalorieCount.text = dProductDetailAfterSource[@"Cals"];
    self.lblDescription.text= [NSString stringWithFormat:@"%@", dProductDetailAfterSource[@"name"]];
    self.lblCalorieCount.text= [NSString stringWithFormat:@"%@", dProductDetailAfterSource[@"Cals"]];
    self.lblPrice.text= [NSString stringWithFormat:@"£%@", dProductDetailAfterSource[@"normalPrice"]];
    //NSLog(@"self.dproductdetail cal %@", self.dProductDetail[@"_source"]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
