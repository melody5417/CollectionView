//
//  ViewController.m
//  CustomCollectionView
//
//  Created by yiqiwang(王一棋) on 2017/6/8.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "HorizontalLineLayout.h"
#import "VerticalLineLayout.h"

static NSString *tableViewCellID = @"tableViewCell";

@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *label;
@end

@implementation TableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.backgroundColor = [UIColor redColor].CGColor;

        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.label];
    }
    return self;
}

@end

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *layoutArray;
@property (nonatomic, strong) NSMutableArray *photosArray;
@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    [self setupLayoutArray];
    [self setupPhotosArray];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setupLayoutArray {
    [_layoutArray removeAllObjects];
    _layoutArray = nil;
    _layoutArray = [NSMutableArray array];

    [_layoutArray addObject:@"HorizontalLineLayout"];
    [_layoutArray addObject:@"VerticalLineLayout"];
}

- (void)setupPhotosArray {
    [_photosArray removeAllObjects];
    _photosArray = nil;
    _photosArray = [NSMutableArray array];
    for (NSInteger i = 1; i <= 32; i++) {
        NSString *photoName = [NSString stringWithFormat:@"%ld.jpg",i];
        UIImage *photo = [UIImage imageNamed:photoName];
        [_photosArray addObject:photo];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewLayout* layout = nil;
    if ([[_layoutArray objectAtIndex:indexPath.item] isEqualToString:@"HorizontalLineLayout"]) {
        layout = [[HorizontalLineLayout alloc] init];
    } else if ([[_layoutArray objectAtIndex:indexPath.item] isEqualToString:@"VerticalLineLayout"]) {
        layout = [[VerticalLineLayout alloc] init];
    }

    CollectionViewController *controller = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:controller animated:YES];
    controller.dataSource = [[NSArray alloc] initWithArray:self.photosArray];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _layoutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithFrame:CGRectZero];
    }
    cell.label.text = [[_layoutArray objectAtIndex:indexPath.item] mutableCopy];
    [cell.label setNeedsDisplay];
    return cell;
}


@end
