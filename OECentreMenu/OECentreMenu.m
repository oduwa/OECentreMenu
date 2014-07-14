//
//  OECentreMenu.m
//
//  Created by Odie Edo-Osagie on 09/07/2014.
//  Copyright (c) 2014 Odie Edo-Osagie. All rights reserved.
//
//  Get the latest version from here:
//
//  https://github.com/oduwa/OECentreMenu
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "OECentreMenu.h"
#import "FXBlurView.h"
#import "AppUtils.h"
#import <QuartzCore/QuartzCore.h>

#define DEVICE_SIZE [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:[[UIScreen mainScreen] bounds] fromView:nil].size

#define COLOUR_PURPLE_STUDIO [AppUtils colorWithHexString:@"#8E44AD"];
#define COLOUR_PURPLE_REBECCAPURPLE [AppUtils colorWithHexString:@"#663399"];
#define COLOUR_PURPLE_HONEYFLOWER [AppUtils colorWithHexString:@"#674172"];


@implementation OECentreMenu


#pragma mark - Initialization

- (instancetype) init
{
    self = [super init];
    
    if(self){
        _backgroundView = [[UIView alloc] init];
        _initialBackgroundFrame = CGRectZero;
        _finalBackgroundFrame = CGRectZero;
        
        _item1 = [[UIButton alloc] init];
        _initialItem1Frame = CGRectZero;
        _finalItem1Frame = CGRectZero;
        
        _item2 = [[UIButton alloc] init];
        _initialItem2Frame = CGRectZero;
        _finalItem2Frame = CGRectZero;
        
        _item3 = [[UIButton alloc] init];
        _initialItem3Frame = CGRectZero;
        _finalItem3Frame = CGRectZero;
        
        _item4 = [[UIButton alloc] init];
        _initialItem4Frame = CGRectZero;
        _finalItem4Frame = CGRectZero;
        
        _item5 = [[UIButton alloc] init];
        _initialItem5Frame = CGRectZero;
        _finalItem5Frame = CGRectZero;
        
        _item6 = [[UIButton alloc] init];
        _initialItem6Frame = CGRectZero;
        _finalItem6Frame = CGRectZero;
    }
    
    return self;
}


- (id) initInViewController: (UIViewController *)vc withButtons:(NSArray *)buttons andVerticalOffset: (float)yValue
{
    return [self initPrivatelyWithController:vc andButtons:buttons andOffSet:yValue];
}

- (id) initInViewController: (UIViewController *)vc withButtons: (NSArray *)buttons thatHasTabBar: (BOOL) hasTabBar
{
    int tabBarHeight;
    
    if(!hasTabBar){
        tabBarHeight = 0;
    }
    else{
        tabBarHeight = 49;
    }
    
    if([vc isKindOfClass:[UITableViewController class]]){
        tabBarHeight += 70;
    }
    
    return [self initPrivatelyWithController:vc andButtons:buttons andOffSet:tabBarHeight];
}

- (id) initPrivatelyWithController: (UIViewController *)vc andButtons: (NSArray *) buttons andOffSet: (float) yValue
{
    self = [self init];
    
    self.vc = vc;
    self.centreOffSet_vertical = yValue;
    self.backgroundColour = COLOUR_PURPLE_HONEYFLOWER;
    self.transparentTintColour = [UIColor cyanColor];
    
    
    /* Background View */
    _initialBackgroundFrame = CGRectMake(DEVICE_SIZE.width+20, (DEVICE_SIZE.height/2)-yValue, 10, 10);
    _finalBackgroundFrame = CGRectMake((DEVICE_SIZE.width/2)-80-20, (DEVICE_SIZE.height/2)-yValue-20, 210, 140);
    _backgroundView = [[FXBlurView alloc] init];
    [_backgroundView setFrame:_initialBackgroundFrame];
    _backgroundView.layer.cornerRadius = 5.0f;
    _backgroundView.tintColor = self.transparentTintColour;
    [vc.view addSubview:_backgroundView];
    
    _regularBackgroundView = [[UIView alloc] initWithFrame:_initialBackgroundFrame];
    _regularBackgroundView.layer.cornerRadius = 5.0f;
    _regularBackgroundView.backgroundColor = self.backgroundColour;
    [vc.view addSubview:_regularBackgroundView];
    
    _blurredBackgroundView = _backgroundView;
    
    /* top left */
    _finalItem1Frame = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-yValue, 50, 50);
    _initialItem1Frame = CGRectMake(-50, -50, 50, 50);
    if([buttons count] < 1){
        _item1 = [[UIButton alloc] init];
        _item1.backgroundColor = [UIColor redColor];
        [_item1 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [_item1 addTarget:self
                   action:@selector(buttonPressed)
         forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        _item1 = buttons[0];
    }
    [_item1 setFrame:_initialItem1Frame];
    _item1.layer.cornerRadius = 25.0;
    _item1.clipsToBounds = YES;
    [vc.view addSubview:_item1];
    
    /* top center */
    _finalItem2Frame = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-yValue, 50, 50);
    _initialItem2Frame = CGRectMake((DEVICE_SIZE.width/2)-80+60, -50, 50, 50);
    if([buttons count] < 2){
        _item2 = [[UIButton alloc] init];
        _item2.backgroundColor = [UIColor yellowColor];
        [_item2 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [_item2 addTarget:self
                   action:@selector(buttonPressed)
         forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        _item2 = buttons[1];
    }
    [_item2 setFrame:_initialItem2Frame];
    _item2.layer.cornerRadius = 25.0;
    _item2.clipsToBounds = YES;
    [vc.view addSubview:_item2];
    
    /* top right */
    _finalItem3Frame = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-yValue, 50, 50);
    _initialItem3Frame = CGRectMake(DEVICE_SIZE.width+20, -50, 50, 50);
    if([buttons count] < 3){
        _item3 = [[UIButton alloc] init];
        _item3.backgroundColor = [UIColor blueColor];
        [_item3 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [_item3 addTarget:self
                   action:@selector(buttonPressed)
         forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        _item3 = buttons[2];
    }
    [_item3 setFrame:_initialItem3Frame];
    _item3.layer.cornerRadius = 25.0;
    _item3.clipsToBounds = YES;
    [vc.view addSubview:_item3];
    
    /* bottom left */
    _finalItem4Frame = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-yValue+50, 50, 50);
    _initialItem4Frame = CGRectMake(-50, DEVICE_SIZE.height+50-yValue, 50, 50);
    if([buttons count] < 4){
        _item4 = [[UIButton alloc] init];
        _item4.backgroundColor = [UIColor orangeColor];
        [_item4 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [_item4 addTarget:self
                   action:@selector(buttonPressed)
         forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        _item4 = buttons[3];
    }
    [_item4 setFrame:_initialItem4Frame];
    _item4.layer.cornerRadius = 25.0;
    _item4.clipsToBounds = YES;
    [vc.view addSubview:_item4];
    
    /* bottom center */
    _finalItem5Frame = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-yValue+50, 50, 50);
    _initialItem5Frame = CGRectMake((DEVICE_SIZE.width/2)-80+60, DEVICE_SIZE.height+50, 50, 50);
    if([buttons count] < 5){
        _item5 = [[UIButton alloc] init];
        _item5.backgroundColor = [UIColor cyanColor];
        [_item5 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [_item5 addTarget:self
                   action:@selector(buttonPressed)
         forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        _item5 = buttons[4];
    }
    [_item5 setFrame:_initialItem5Frame];
    _item5.layer.cornerRadius = 25.0;
    _item5.clipsToBounds = YES;
    [vc.view addSubview:_item5];
    
    
    /* bottom right */
    _finalItem6Frame = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-yValue+50, 50, 50);
    _initialItem6Frame = CGRectMake(DEVICE_SIZE.width+20, DEVICE_SIZE.height+50-yValue, 50, 50);
    if([buttons count] < 6){
        _item6 = [[UIButton alloc] init];
        _item6.backgroundColor = [UIColor magentaColor];
        [_item6 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [_item6 addTarget:self
                   action:@selector(buttonPressed)
         forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        _item6 = buttons[5];
    }
    [_item6 setFrame:_initialItem6Frame];
    _item6.layer.cornerRadius = 25.0;
    _item6.clipsToBounds = YES;
    [vc.view addSubview:_item6];
    
    [self hide];
    
    return self;
}

#pragma mark - Presentation

- (void) show
{
    
    if(!self){
        [NSException raise:@"UninitializedMenuException" format:@"Attempting to show menu without first initializing one."];
    }
    
    [self addToDisplay];
    
    [UIView animateWithDuration:0.2 animations:^{
        _backgroundView.frame = _finalBackgroundFrame;
    }];
    
    [self runSpinAnimationOnView:_item1 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item1 setFrame:_finalItem1Frame];
    } completion:^(BOOL finished) {
        [_item1.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item2 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item2 setFrame:_finalItem2Frame];
    } completion:^(BOOL finished) {
        [_item2.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item3 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item3 setFrame:_finalItem3Frame];
    } completion:^(BOOL finished) {
        [_item3.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item4 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item4 setFrame:_finalItem4Frame];
    } completion:^(BOOL finished) {
        [_item4.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item5 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item5 setFrame:_finalItem5Frame];
    } completion:^(BOOL finished) {
        [_item5.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item6 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        _item6.frame = _finalItem6Frame;
    } completion:^(BOOL finished) {
        [_item6.layer removeAllAnimations];
    }];
    
}


- (void) hide
{
    
    if(!self){
        [NSException raise:@"UninitializedMenuException" format:@"Attempting to hide menu without first initializing one."];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        _backgroundView.frame = _initialBackgroundFrame;
    }];
    
    [self runSpinAnimationOnView:_item1 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item1 setFrame:_initialItem1Frame];
    } completion:^(BOOL finished) {
        [_item1.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item2 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item2 setFrame:_initialItem2Frame];
    } completion:^(BOOL finished) {
        [_item2.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item3 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item3 setFrame:_initialItem3Frame];
    } completion:^(BOOL finished) {
        [_item3.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item4 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item4 setFrame:_initialItem4Frame];
    } completion:^(BOOL finished) {
        [_item4.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item5 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [_item5 setFrame:_initialItem5Frame];
    } completion:^(BOOL finished) {
        [_item5.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:_item6 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        _item6.frame = _initialItem6Frame;
    } completion:^(BOOL finished) {
        [_item6.layer removeAllAnimations];
        [self removeFromDisplay];
    }];
    
}

- (void) removeFromDisplay
{
    [_backgroundView removeFromSuperview];
    [_item1 removeFromSuperview];
    [_item2 removeFromSuperview];
    [_item3 removeFromSuperview];
    [_item4 removeFromSuperview];
    [_item5 removeFromSuperview];
    [_item6 removeFromSuperview];
}

- (void) addToDisplay
{
    [self.vc.view addSubview:_backgroundView];
    [self.vc.view addSubview:_item1];
    [self.vc.view addSubview:_item2];
    [self.vc.view addSubview:_item3];
    [self.vc.view addSubview:_item4];
    [self.vc.view addSubview:_item5];
    [self.vc.view addSubview:_item6];
}

- (void) updateFramesAfterDeviceRotation
{
    _initialBackgroundFrame = CGRectMake((DEVICE_SIZE.width/2), (DEVICE_SIZE.height/2)-_centreOffSet_vertical, 1, 1);
    _finalBackgroundFrame = CGRectMake((DEVICE_SIZE.width/2)-80-20, (DEVICE_SIZE.height/2)-_centreOffSet_vertical-20, 210, 140);
    
    
    _finalItem1Frame = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-_centreOffSet_vertical, 50, 50);
    _initialItem1Frame = CGRectMake(-50, -50, 50, 50);
    
    
    _finalItem2Frame = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-_centreOffSet_vertical, 50, 50);
    _initialItem2Frame = CGRectMake(80+60, -50, 50, 50);
    
    
    _finalItem3Frame = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-_centreOffSet_vertical, 50, 50);
    _initialItem3Frame = CGRectMake(DEVICE_SIZE.width+20, -50, 50, 50);
    
    
    _finalItem4Frame = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-_centreOffSet_vertical+50, 50, 50);
    _initialItem4Frame = CGRectMake(-50, DEVICE_SIZE.height+50-_centreOffSet_vertical, 50, 50);
    
    
    _finalItem5Frame = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-_centreOffSet_vertical+50, 50, 50);
    _initialItem5Frame = CGRectMake((DEVICE_SIZE.width/2)-80+60, DEVICE_SIZE.height+50, 50, 50);
    
    
    _finalItem6Frame = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-_centreOffSet_vertical+50, 50, 50);
    _initialItem6Frame = CGRectMake(DEVICE_SIZE.width+20, DEVICE_SIZE.height+50-_centreOffSet_vertical, 50, 50);
    
    
    [_backgroundView setFrame:_finalBackgroundFrame];
    [_item1 setFrame:_finalItem1Frame];
    [_item2 setFrame:_finalItem2Frame];
    [_item3 setFrame:_finalItem3Frame];
    [_item4 setFrame:_finalItem4Frame];
    [_item5 setFrame:_finalItem5Frame];
    [_item6 setFrame:_finalItem6Frame];
}


#pragma mark - Setters and Customization

- (void) setBackgroundBlurEnabled:(BOOL) enabled
{
    if(enabled){
        _backgroundView = _blurredBackgroundView;
    }
    else{
        _backgroundView = _regularBackgroundView;
    }
}


- (void) setShowsBackgroundFrame:(BOOL) hasFrame
{
    if(hasFrame){
        _backgroundView.backgroundColor = self.backgroundColour;
        _backgroundView.tintColor = self.transparentTintColour;
    }
    else{
        [self setBackgroundBlurEnabled:NO];
        
        _backgroundView.backgroundColor = nil;
        _backgroundView.tintColor = nil;
    }
}

- (void) changeBackgroundColour:(UIColor *)backgroundColour
{
    self.backgroundColour = backgroundColour;
    
    _regularBackgroundView.backgroundColor = self.backgroundColour;
}

- (void) changeTransparentTintColour:(UIColor *)transparentTintColour
{
    self.transparentTintColour = transparentTintColour;
    
    _blurredBackgroundView.tintColor = self.transparentTintColour;
}







#pragma mark - Helper Methods

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}



#pragma mark - Selectors

- (void) buttonPressed
{
    NSLog(@"OECentreMenu: BUTTON PRESSED!!!");
}











@end
