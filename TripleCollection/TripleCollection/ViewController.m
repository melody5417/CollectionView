//
//  ViewController.m
//  TripleCollection
//
//  Created by yiqiwang(王一棋) on 2017/6/8.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *photosArray;
@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    [self setupPhotosArray];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"MY_CELL"];
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

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _photosArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    cell.imageView.image = _photosArray[indexPath.item];
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

@end
