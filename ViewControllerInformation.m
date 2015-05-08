//
//  ViewControllerInformation.m
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import "ViewControllerInformation.h"
#import "AppDelegate.h"
#import "ViewControllerChoose.h"

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
    
    self. stepper. wraps = YES; self. stepper. autorepeat = YES;
    NSUInteger value = self. stepper. value; self. valueLabel. text = [ NSString stringWithFormat: @"%02d", value];
    
    self . stepper .maximumValue = 10 ;
    
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

- ( IBAction)stepperValueChanged:( UIStepper *)sender
{
    NSUInteger value = sender. value;
    self. valueLabel. text = [ NSString stringWithFormat: @"%02d", value];
}



- ( IBAction) BtnFitBit {
    
    UIAlertView *alert = [[ UIAlertView alloc ] initWithTitle :@"Information" message :@"Are you sure you want to add this to your fitbit data?"   delegate : self cancelButtonTitle :@"No" otherButtonTitles :@"Yes" , nil ];
    [alert show];
    
}

#pragma mark -
#pragma mark Alert View

- ( void) alertView:( UIAlertView *)alertView clickedButtonAtIndex:( NSInteger)buttonIndex {
    if (buttonIndex == 1) {
//        UINavigationController *vc = [ self . storyboard instantiateViewControllerWithIdentifier : @"Terry" ];
//        [ self presentViewController :vc animated : YES completion : nil ];
        NSInteger qty = [self.valueLabel.text intValue];
        NSInteger cals = [self.lblCalorieCount.text intValue];
        NSInteger *calsToDeduct = qty*cals;
        [AppDelegate class]
        NSLog(@"%d", calsToDeduct);
        [self.navigationController popToRootViewControllerAnimated:true];
    }
}



//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([segue.identifier isEqualToString:@"segueToDetailView"]) {
//        
//        DetailViewController *vc = segue.destinationViewController;
//        int intSelectedRow = [self.tvGroceries indexPathForSelectedRow].row;
//        
//        GroceryCell *cell = (GroceryCell *)[self.tvGroceries cellForRowAtIndexPath:[self.tvGroceries indexPathForSelectedRow]];
//        
//        vc.dProduct= self.marGroceries[intSelectedRow];
//        vc.imgProductImage = cell.ivImage.image;
//        
//    }
//    
//}

@end
