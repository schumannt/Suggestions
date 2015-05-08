//
//  ViewControllerFood.m
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import "ViewControllerFood.h"
#import "TableViewCellFood.h"
#import "ViewControllerChoose.h"

@interface ViewControllerFood ()

@end

@implementation ViewControllerFood

- (void) viewWillAppear:(BOOL)animated {
    [self getFoodChoices];
    [self.tvFood reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self getFoodChoices];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)getFoodChoices {
    //NSMutableDictionary *dFood = [[NSMutableDictionary alloc] init];
    
    ViewControllerChoose *vcc = [self.storyboard instantiateViewControllerWithIdentifier:@"Choose"];
    NSString *strAisle = @"Lunch On The Go";
    if (self.rowSelectedMeal  == 1){
        strAisle = @"Lunch On The Go";
        NSLog(@"straisl");
    } else if (self.rowSelectedMeal  == 2){
        strAisle = @"Crisps & Snacks";
    } else if (self.rowSelectedMeal  == 3){
        strAisle = @"Lunch On The Go";
    } else {
        strAisle = @"Breakfast On The Go";
    }

    
    
    
    NSString *strCalsStart = @"1";
    NSString *strCalsEnd = @"200";
    NSString *strStoreNum = @"2025";
    NSLog(@"this is printing str aisle, %@", strAisle);
    NSLog(@"this is printing vcc.lblmealchoice %@", vcc.lblMealChoice.text);
    
    NSString *strFoodQuery = [NSString stringWithFormat:@"{\"query\":{\"bool\":{\"must\":[{\"query_string\":{\"default_field\":\"product.aisle\",\"query\":\"%@ \"}},{\"range\":{\"product.Cals\":{\"from\":\"%@\",\"to\":\"%@\"}}},{\"query_string\":{\"default_field\":\"product.store_availability.store\",\"query\":\"%@\"}}],\"must_not\":[],\"should\":[]}},\"from\":0,\"size\":10,\"sort\":[],\"facets\":{}}", strAisle, strCalsStart, strCalsEnd, strStoreNum];
        NSLog(strFoodQuery);
    
    NSData* cData = [strFoodQuery dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost:9200/ghs.healthAPI/_search"]];
    
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest setHTTPBody:cData];
    
    //    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:9200/ghs.healthAPI/_search"]];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
        
        
        NSDictionary *dResults = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        //        self.marGroceries = dResults[@"Results"];
        //        NSLog(@"%@", dResults);
        
        NSDictionary *dHits = [dResults objectForKey:@"hits"];
        //NSMutableArray *marFoodList = [dHits objectForKey:@"hits"];
        self.marFoodList = [dHits objectForKey:@"hits"];
        
        //NSLog(@"need this one to change!%d", self.marFoodList.count);
        [self.tvFood reloadData];
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //            [self.tvGroceries reloadData];
        //            self.vWaiting.hidden = YES;
    }];
}


- (IBAction) scFoodType {
    if (self.uscFoodType.selectedSegmentIndex == 0) {
        self.tvFood.hidden = NO;
        self.tvDrink.hidden = YES;
        self.tvSnack.hidden = YES;
    }
    if (self.uscFoodType.selectedSegmentIndex == 1) {
       // NSLog(@"getting to here");
        self.tvFood.hidden = YES;
        self.tvDrink.hidden = NO;
        self.tvSnack.hidden = YES;
    }
    if (self.uscFoodType.selectedSegmentIndex == 2) {
        self.tvFood.hidden = YES;
        self.tvDrink.hidden = YES;
        self.tvSnack.hidden = NO;
    }
}



- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    //how many sections?
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.marFood.count;
    //how many rows in section?
    
    
    
    if (tableView == self.tvFood ) {
        //NSLog(@"arrrrrrrrrrFoodlist %d", self.marFoodList.count);
        return self.marFoodList.count;
        
    }
    else if (tableView == self.tvDrink){
        return self.marDrink.count;
    }
    else {
        return self.marSnack.count;
    }

    
    
    
}
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleNone;
    
    
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView == self.tvFood) {
        
    TableViewCellFood *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        NSMutableDictionary *dOneProduct = self.marFoodList[indexPath.row];

        NSMutableDictionary *dDetailOneProduct = dOneProduct[@"_source"];
        //NSLog(@"dDetailOneProduct %@", dDetailOneProduct);
        cell.lblProductName.text = dDetailOneProduct[@"name"];

        cell.lblProductPrice.text = [NSString stringWithFormat:@"£%@", dDetailOneProduct[@"normalPrice"]];
        cell.lblProductKcal.text = [NSString stringWithFormat:@"%@", dDetailOneProduct[@"Cals"]];
        cell.ivProductImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dDetailOneProduct[@"image"]]]];
        
        //NSLog(@"image string!!! %@", dDetailOneProduct[@"image"]);
    return cell;
    }
    
    if (tableView == self.tvDrink){
        TableViewCellFood *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell2.textLabel.text = self.marDrink[indexPath.row];
        return cell2;
    }
    else {
        TableViewCellFood *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        cell3.textLabel.text = self.marSnack[indexPath.row];
        return cell3;
    }
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //this is getting the unused cell
    /*if (cell == Nil)
    {
        NSLog(@"Making New cell");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: @"cell"];
        cell.textLabel.text = self.marFood[indexPath.row];
    }
    //if this cell is empty then create a new cell
    else {
        NSLog(@"reusing a cell");
    }
     */

    //NSMutableDictionary *dComment = self.marFood[indexPath.row];
    //cell.textLabel.text       = dComment[@"CommentText"];
    //NSLog(@" cell.textlabel.text: %@", cell.textLabel.text);
    //cell.detailTextLabel.text = dComment[@"NameText"];
    //NSLog(@"cell.detailtetlabel.text: %@", cell.detailTextLabel.text);

    
}








@end
