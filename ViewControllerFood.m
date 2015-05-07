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

- (IBAction) scFoodType {
    if (self.uscFoodType == 0) {
        self.tvFood.hidden = NO;
        self.tvDrink.hidden = YES;
        self.tvSnack.hidden = YES;
    }
    if (self.uscFoodType == 1) {
        self.tvFood.hidden = YES;
        self.tvDrink.hidden = NO;
        self.tvSnack.hidden = YES;
    }
    if (self.uscFoodType == 2) {
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
        
        
        
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //this is getting the unused cell
    if (cell == Nil)
    {
        NSLog(@"Making New cell");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: @"cell"];
        cell.textLabel.text = self.marFood[indexPath.row];
    }
    //if this cell is empty then create a new cell
    else {
        NSLog(@"reusing a cell");
    }
    
    
    
    cell.textLabel.text = self.marFood[indexPath.row];
    //NSMutableDictionary *dComment = self.marFood[indexPath.row];
    //cell.textLabel.text       = dComment[@"CommentText"];
    //NSLog(@" cell.textlabel.text: %@", cell.textLabel.text);
    //cell.detailTextLabel.text = dComment[@"NameText"];
    //NSLog(@"cell.detailtetlabel.text: %@", cell.detailTextLabel.text);
    return cell;
    
}








@end
