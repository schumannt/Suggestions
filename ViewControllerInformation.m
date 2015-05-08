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
    
    
    NSString *newImageURL = [dProductDetailAfterSource[@"image"] stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
    NSString *biggerImageURL = [newImageURL stringByReplacingOccurrencesOfString:@"90" withString:@"225"];
    //self.lblCalorieCount.text = dProductDetailAfterSource[@"Cals"];
    self.lblDescription.text= [NSString stringWithFormat:@"%@", dProductDetailAfterSource[@"name"]];
    self.lblCalorieCount.text= [NSString stringWithFormat:@"%@", dProductDetailAfterSource[@"Cals"]];
    self.lblPrice.text= [NSString stringWithFormat:@"£%@", dProductDetailAfterSource[@"normalPrice"]];
    self.ivProductImageDetail.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:biggerImageURL]]];
    self.lblFat.text =[NSString stringWithFormat:@"%@", dProductDetailAfterSource[@"Fat"]];
    self.lblSalt.text =[NSString stringWithFormat:@"%@", dProductDetailAfterSource[@"Salt"]];
    self.lblSugar.text =[NSString stringWithFormat:@"%@", dProductDetailAfterSource[@"Sugar"]];
    
    
//    NSMutableArray *marLocation = [[NSMutableArray alloc] init];
//    [marLocation addObject:@"Aisle 4, on right];
//    [marLocation addObject:@"Aisle 3, half way"];
//    [marLocation addObject:@"Aisle 11, on left"];
//    [marLocation addObject:@"Aisle 1, at the end"];
//    [marLocation addObject:@"Aisle 2, half way"];
    
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
