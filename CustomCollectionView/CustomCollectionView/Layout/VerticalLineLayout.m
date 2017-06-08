//
//  VerticalLineLayout.m
//  CustomCollectionView
//
//  Created by yiqiwang(王一棋) on 2017/6/8.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "VerticalLineLayout.h"

#define ITEM_SIZE 200.0
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.5

@implementation VerticalLineLayout

- (instancetype)init {
    if (self = [super init]) {
        self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        self.minimumLineSpacing = 200;
        self.minimumInteritemSpacing = 200;
    }
    return self;
}

// 当根据位置提供不同layout属性的时候，需要返回YES，这样当边界改变时，layout会刷新
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds {
    return YES;
}

// 当前item放大
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGFloat verticalCenter = CGRectGetHeight(self.collectionView.bounds) / 2.0;

    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGPoint attributesCenter = [self.collectionView convertPoint:attributes.center toView:self.collectionView.window];
            CGFloat distance = verticalCenter - attributesCenter.y;
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            if (ABS(distance) < ACTIVE_DISTANCE) {
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
            }
        }
    }
    return array;
}

// 自动对齐到网络
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat verticalCenter = proposedContentOffset.y + (CGRectGetHeight(self.collectionView.bounds) / 2.0);

    CGRect targetRect = CGRectMake(proposedContentOffset.x,
                                   proposedContentOffset.y,
                                   self.collectionView.bounds.size.width,
                                   self.collectionView.bounds.size.height);

    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];

    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemVerticalCenter = layoutAttributes.center.y;
        if (ABS(itemVerticalCenter - verticalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemVerticalCenter - verticalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x,
                       proposedContentOffset.y + offsetAdjustment);
}

@end
