//
//  NormalCellCollectionViewCell.m
//  IOS_Collection
//
//  Created by Bc_Ltf on 15/4/11.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//

#import "NormalCellCollectionViewCell.h"
#import "NormalCellBackground.h"

@implementation NormalCellCollectionViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view
        NormalCellBackground *backgroundView = [[NormalCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;
    }
    return self;
}

@end
