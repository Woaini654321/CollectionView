//
//  ViewController.m
//  CollectionView
//
//  Created by 晏玉龙 on 2017/3/8.
//  Copyright © 2017年 晏玉龙. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "FlowLayout.h"

static NSString *ID = @"cell";
#define ScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UICollectionViewFlowLayout *layout = [self setupCollectionViewFlowLayout];
//    
//    [self setupCollectionView:layout];
    
    UICollectionViewFlowLayout *layout = ({
        FlowLayout *layout = [[FlowLayout alloc] init];
        layout.itemSize = CGSizeMake(160, 160);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGFloat margin = (ScreenW - 160) * 0.5;
        layout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
        layout.minimumLineSpacing = 50;
        layout;
    });
    
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor redColor];
        collectionView.center = self.view.center;
        collectionView.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 200);
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.showsHorizontalScrollIndicator = NO;
        
        [self.view addSubview:collectionView];
        collectionView;
    });
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
}

#pragma mark - 创建UICollectionView
- (void)setupCollectionView:(UICollectionViewFlowLayout *)layout{
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor redColor];
    collectionView.center = self.view.center;
    collectionView.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
}

- (UICollectionViewFlowLayout *)setupCollectionViewFlowLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(160, 160);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat margin = (ScreenW - 160) * 0.5;
    layout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
    layout.minimumLineSpacing = 50;
    return layout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"1"];
    return cell;
}

@end
