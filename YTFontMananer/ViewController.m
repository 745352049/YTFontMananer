//
//  ViewController.m
//  YTFontMananer
//
//  Created by iOS开发 on 2020/6/28.
//  Copyright © 2020 陕西文投教育科技有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"字体家族";
    
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    
    NSLog(@"[familyNames count] === %lu", (unsigned long)[familyNames count]);
    for (int familyCount = 0; familyCount < [familyNames count]; familyCount ++) {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:familyCount]);
        fontNames = [[NSArray alloc] initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:familyCount]]];
        for(int fontCount = 0; fontCount < [fontNames count]; fontCount ++) {
            NSLog(@"Font name: %@", [fontNames objectAtIndex:fontCount]);
            
        }
    }
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.estimatedRowHeight = 99.0;
    self.tableView.rowHeight =  UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[UIFont fontNamesForFamilyName:[[UIFont familyNames] objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELLID"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *familyName= [[UIFont familyNames] objectAtIndex:indexPath.section];
    NSArray *fontNameArray = [UIFont fontNamesForFamilyName:familyName];
    
    NSString *fontName  = [fontNameArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld、测试字体 ABCD abcd 1234", (long)indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:fontName size:18.0f];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", fontName];
    cell.detailTextLabel.font = [UIFont fontWithName:fontName size:16.0f];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Font name --- %@", [[UIFont fontNamesForFamilyName:[[UIFont familyNames] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"%ld -- %@", (long)section, [[UIFont familyNames] objectAtIndex:section]];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

@end
