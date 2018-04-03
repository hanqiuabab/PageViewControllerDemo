//
//  TitleItemCollectionViewCell.m
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/4/3.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "TitleItemCollectionViewCell.h"

@interface TitleItemCollectionViewCell()

@end

@implementation TitleItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configure:(NSString *)title {
    self.titleLab.text = title;
    
}
@end
