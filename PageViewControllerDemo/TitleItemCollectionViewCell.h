//
//  TitleItemCollectionViewCell.h
//  PageViewControllerDemo
//
//  Created by 陆久银 on 2018/4/3.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleItemCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;


- (void)configure:(NSString *)title;
@end
