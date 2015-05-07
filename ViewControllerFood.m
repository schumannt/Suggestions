//
//  ViewControllerFood.m
//  Suggests
//
//  Created by group16 on 07/05/2015.
//  Copyright (c) 2015 Tesco. All rights reserved.
//

#import "ViewControllerFood.h"
#import "TableViewCellFood.h"

@interface ViewControllerFood ()

@end

@implementation ViewControllerFood

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.marFood = [[NSMutableArray alloc]init];
    [self.marFood addObject:@"Chicken Sandwich"];
    [self.marFood addObject:@"Cheese and tomato Sandwich"];
    [self.marFood addObject:@"Pesto Salad"];
    
    self.marDrink = [[NSMutableArray alloc]init];
    [self.marDrink addObject:@"Diet Coke"];
    [self.marDrink addObject:@"Iron Bru"];
    [self.marDrink addObject:@"Vodka"];
    [self.marDrink addObject:@"Lemonade"];
    
    
    self.marSnack = [[NSMutableArray alloc]init];
    [self.marSnack addObject:@"Kit Kat"];
    [self.marSnack addObject:@"Boost"];
    
    
    [self getFoodChoices];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)getFoodChoices {
    //NSMutableDictionary *dFood = [[NSMutableDictionary alloc] init];
    
    NSString *strAisle = @"Lunch On The Go";
    NSString *strCalsStart = @"1";
    NSString *strCalsEnd = @"200";
    NSString *strStoreNum = @"2025";
    
    
    NSString *strFoodQuery = [NSString stringWithFormat:@"{\"query\":{\"bool\":{\"must\":[{\"query_string\":{\"default_field\":\"product.aisle\",\"query\":\"%@ \"}},{\"range\":{\"product.Cals\":{\"from\":\"%@\",\"to\":\"%@\"}}},{\"query_string\":{\"default_field\":\"product.store_availability.store\",\"query\":\"%@\"}}],\"must_not\":[],\"should\":[]}},\"from\":0,\"size\":10,\"sort\":[],\"facets\":{}}", strAisle, strCalsStart, strCalsEnd, strStoreNum];
    NSLog(strFoodQuery);

    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost:9200/ghs.healthAPI/_search"]];
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:9200/ghs.healthAPI/_search"]];

    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
    
    
        NSDictionary *dResults = [NSJSONSerialization JSONObjectWithData:strFoodQuery options:NSJSONReadingMutableLeaves error:nil];
        
        //        self.marGroceries = dResults[@"Results"];
        NSLog(@"%@", dResults);
        
        
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //            [self.tvGroceries reloadData];
        //            self.vWaiting.hidden = YES;
    }];
}


NSMutableDictionary *dlike = [[NSMutableDictionary alloc] init];

dlike[@"UserID"] = self.dAppUser[@"_id"];
dlike[@"UserFirstName"] = self.dAppUser[@"FirstName"];
dlike[@"UserLastName"] = self.dAppUser[@"LastName"];
dlike[@"ImageURL"] = self.dAppUser[@"ImgURL"];
dlike[@"Like"] = [NSNumber numberWithBool: isLiked];

NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/product/%@/like", self.apiEndPoint, productID]]];

NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dlike options:NSJSONWritingPrettyPrinted error:nil];

[theRequest setHTTPMethod:@"POST"];
[theRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
[theRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)jsonData.length] forHTTPHeaderField:@"Content-Length"];
[theRequest setHTTPBody:jsonData];

[NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
    if (completionHandler) completionHandler();
    
}];

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction) scFoodType {
    if (self.uscFoodType.selectedSegmentIndex == 0) {
        self.tvFood.hidden = NO;
        self.tvDrink.hidden = YES;
        self.tvSnack.hidden = YES;
    }
    if (self.uscFoodType.selectedSegmentIndex == 1) {
        NSLog(@"getting to here");
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
        return self.marFood.count;
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
    cell.textLabel.text = self.marFood[indexPath.row];
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
