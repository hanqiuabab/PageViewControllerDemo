//
//  PageTitleBar.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/4/3.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "PageTitleBar.h"
#import "TitleItemCollectionViewCell.h"

@interface PageTitleBar()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation PageTitleBar

- (instancetype)initWithTitleArray:(NSArray *)titleArray {
    self = [super init];
    if (self) {
        self.titleArray = titleArray;
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100, 50);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"TitleItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TitleItemCollectionViewCell"];
    [self addSubview:self.collectionView];
}

#pragma mark - publick
- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated {
    self.currentSelected = index;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:animated];    [self.collectionView reloadData];

}
#pragma mark - UICollectionView Delegate && DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TitleItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitleItemCollectionViewCell" forIndexPath:indexPath];
    [cell configure:self.titleArray[indexPath.row]];
    cell.titleLab.textColor = self.currentSelected == indexPath.row ? [UIColor redColor] : [UIColor blackColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.currentSelected = indexPath.row;
    [collectionView reloadData];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
        [self.delegate didSelectedIndex:indexPath.row];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
}
@end
