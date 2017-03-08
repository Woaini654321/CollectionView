//
//  FlowLayout.m
//  CollectionView
//
//  Created by 晏玉龙 on 2017/3/8.
//  Copyright © 2017年 晏玉龙. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout

- (void)prepareLayout{
    [super prepareLayout];
    NSLog(@"%s",__func__);
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attrs = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT)];
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        CGFloat delta = fabs((attr.center.x - self.collectionView.contentOffset.x) - self.collectionView.bounds.size.width * 0.5);
        CGFloat scale = 1 - delta/(self.collectionView.bounds.size.width * 0.5) * 0.25;
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return attrs;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    CGPoint targetP = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    CGFloat collectionW = self.collectionView.bounds.size.width;
    CGRect targetRect = CGRectMake(targetP.x, 0, collectionW, MAXFLOAT);
    NSArray *attrs = [super layoutAttributesForElementsInRect:targetRect];
    
    CGFloat minelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        CGFloat delta = attr.center.x -targetP.x - self.collectionView.bounds.size.width * 0.5;
        if (fabs(delta) < fabs(minelta)) {
            minelta = delta;
        }
    }
    targetP.x += minelta;
    if (targetP.x < 0) {
        targetP.x = 0;
    }
    return targetP;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (CGSize)collectionViewContentSize{
    return [super collectionViewContentSize];
//    return CGSizeMake(500, 0);
}
@end
