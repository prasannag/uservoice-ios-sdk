//
//  UVSuccessViewController.m
//  UserVoice
//
//  Created by Austin Taylor on 10/23/13.
//  Copyright (c) 2013 UserVoice Inc. All rights reserved.
//

#import "UVSuccessViewController.h"
#import "UVSession.h"
#import "UVClientConfig.h"

@implementation UVSuccessViewController

- (void)loadView {
    [super loadView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.view = [UIView new];
    self.view.frame = [self contentFrame];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *title = [UILabel new];
    title.text = _titleText;
    title.textColor = [UIColor darkTextColor];
    title.font = [UIFont systemFontOfSize:26];
    title.textAlignment = NSTextAlignmentCenter;
    title.backgroundColor = [UIColor clearColor];
    UILabel *text = [UILabel new];
    text.text = _text;
    text.textColor = [UIColor darkTextColor];
    text.font = [UIFont systemFontOfSize:15];
    text.numberOfLines = 0;
    text.textAlignment = NSTextAlignmentCenter;
    text.backgroundColor = [UIColor clearColor];
    
    UIButton *appstoreButton = [UIButton new];
    appstoreButton.layer.backgroundColor = [[UIColor colorWithRed:.78 green:.05 blue:.19 alpha:1] CGColor];
    appstoreButton.layer.cornerRadius = 3.0;
    appstoreButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [appstoreButton setTitle:NSLocalizedStringFromTable(@"Review in AppStore", @"UserVoice", nil) forState:UIControlStateNormal];
    [appstoreButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button = [UIButton new];
    button.layer.backgroundColor = [[UIColor colorWithRed:.78 green:.05 blue:.19 alpha:1] CGColor];
    button.layer.cornerRadius = 3.0;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:NSLocalizedStringFromTable(@"Close", @"UserVoice", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    UILabel *power = [UILabel new];
    power.text = NSLocalizedStringFromTable(@"Powered by UserVoice", @"UserVoice", nil);
    power.textColor = [UIColor grayColor];
    power.font = [UIFont systemFontOfSize:13];
    power.textAlignment = NSTextAlignmentCenter;
    power.backgroundColor = [UIColor clearColor];
    if ([UVSession currentSession].clientConfig.whiteLabel) {
        power.hidden = YES;
    }
    [self configureView:self.view
               subviews:NSDictionaryOfVariableBindings(title, text, appstoreButton, button, power)
            constraints:@[@"|-[title]-|", @"|-40-[text]-40-|", @"[appstoreButton(>=90)]-(50)-[button(==appstoreButton)]", @"|-[power]-|", @"V:|-(>=20)-[title]-16-[text]-40-[button(==44)]-(>=40)-[power]-20-|"]];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:160];
    constraint.priority = UILayoutPriorityDefaultLow;
    [self.view addConstraint:constraint];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:appstoreButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:appstoreButton attribute:NSLayoutAttributeBaseline relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeBaseline multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:appstoreButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:100]];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
