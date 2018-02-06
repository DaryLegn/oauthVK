//
//  FriendsTableViewCell.h
//  DaryLegnTZ
//
//  Created by Дарья Кравченко on 04.02.2018.
//  Copyright © 2018 Дарья Лень. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@end
