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
#import "UIERealTimeBlurView.h"
#import "FXBlurView.h"
#import <QuartzCore/QuartzCore.h>

#define DEVICE_SIZE [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:[[UIScreen mainScreen] bounds] fromView:nil].size

FXBlurView *menuBackground;
CGRect initialMenuFrame;
CGRect finalMenuFrame;


UIButton *circle;
CGRect initialCircleFrame;
CGRect finalCircleFrame;


UIButton *circle2;
CGRect initialCircleFrame2;
CGRect finalCircleFrame2;

UIButton *circle3;
CGRect initialCircleFrame3;
CGRect finalCircleFrame3;

UIButton *circle4;
CGRect initialCircleFrame4;
CGRect finalCircleFrame4;

UIButton *circle5;
CGRect initialCircleFrame5;
CGRect finalCircleFrame5;

UIButton *circle6;
CGRect initialCircleFrame6;
CGRect finalCircleFrame6;

NSArray *buttonsStore;
UIViewController *vcStore;

BOOL initialized;

@implementation OECentreMenu

+ (void) setMenuBackgroundColor:(UIColor *)color
{
    menuBackground.tintColor = color;
}

+ (void) setupMenuInViewController:(UIViewController *)vc thatHasTabBar:(BOOL) hasTabBar
{
    [self setupMenuInViewController:vc withButtons:nil thatHasTabBar:hasTabBar];
}

+ (void) setupMenuInViewController:(UIViewController *)vc withButtons:(NSArray *)buttons thatHasTabBar:(BOOL) hasTabBar
{
    vcStore = vc;
    buttonsStore = buttons;
    initialized = YES;
    
    int tabBarHeight;
    
    if(hasTabBar){
        tabBarHeight = 49;
    }
    else{
        tabBarHeight = 0;
    }
    
    NSLog(@"%d", tabBarHeight);
    
    /* Background View */
    initialMenuFrame = CGRectMake(DEVICE_SIZE.width+20, (DEVICE_SIZE.height/2)-tabBarHeight, 10, 10);
    finalMenuFrame = CGRectMake((DEVICE_SIZE.width/2)-80-20, (DEVICE_SIZE.height/2)-tabBarHeight-20, 210, 140);
    menuBackground = [[FXBlurView alloc] init];
    [menuBackground setFrame:initialMenuFrame];
    menuBackground.layer.cornerRadius = 5.0f;
    menuBackground.tintColor = [UIColor cyanColor];
    [vc.view addSubview:menuBackground];
    
    /* top left */
    finalCircleFrame = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-tabBarHeight, 50, 50);
    initialCircleFrame = CGRectMake(-50, -50, 50, 50);
    if([buttons count] < 1){
        circle = [[UIButton alloc] init];
        circle.backgroundColor = [UIColor redColor];
        [circle setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [circle addTarget:self
                action:@selector(buttonPressed)
                forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        circle = buttons[0];
    }
    [circle setFrame:initialCircleFrame];
    circle.layer.cornerRadius = 25.0;
    circle.clipsToBounds = YES;
    [vc.view addSubview:circle];
    
    /* top center */
    finalCircleFrame2 = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-tabBarHeight, 50, 50);
    initialCircleFrame2 = CGRectMake((DEVICE_SIZE.width/2)-80+60, -50, 50, 50);
    if([buttons count] < 2){
        circle2 = [[UIButton alloc] init];
        circle2.backgroundColor = [UIColor yellowColor];
        [circle2 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [circle2 addTarget:self
                 action:@selector(buttonPressed)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        circle2 = buttons[1];
    }
    [circle2 setFrame:initialCircleFrame2];
    circle2.layer.cornerRadius = 25.0;
    circle2.clipsToBounds = YES;
    [vc.view addSubview:circle2];
    
    /* top right */
    finalCircleFrame3 = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-tabBarHeight, 50, 50);
    initialCircleFrame3 = CGRectMake(DEVICE_SIZE.width+20, -50, 50, 50);
    if([buttons count] < 3){
        circle3 = [[UIButton alloc] init];
        circle3.backgroundColor = [UIColor blueColor];
        [circle3 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [circle3 addTarget:self
                 action:@selector(buttonPressed)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        circle3 = buttons[2];
    }
    [circle3 setFrame:initialCircleFrame3];
    circle3.layer.cornerRadius = 25.0;
    circle3.clipsToBounds = YES;
    [vc.view addSubview:circle3];
    
    /* bottom left */
    finalCircleFrame4 = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-tabBarHeight+50, 50, 50);
    initialCircleFrame4 = CGRectMake(-50, DEVICE_SIZE.height+50-tabBarHeight, 50, 50);
    if([buttons count] < 4){
        circle4 = [[UIButton alloc] init];
        circle4.backgroundColor = [UIColor orangeColor];
        [circle4 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [circle4 addTarget:self
                action:@selector(buttonPressed)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        circle4 = buttons[3];
    }
    [circle4 setFrame:initialCircleFrame4];
    circle4.layer.cornerRadius = 25.0;
    circle4.clipsToBounds = YES;
    [vc.view addSubview:circle4];
    
    /* bottom center */
    finalCircleFrame5 = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-tabBarHeight+50, 50, 50);
    initialCircleFrame5 = CGRectMake((DEVICE_SIZE.width/2)-80+60, DEVICE_SIZE.height+50, 50, 50);
    if([buttons count] < 5){
        circle5 = [[UIButton alloc] init];
        circle5.backgroundColor = [UIColor cyanColor];
        [circle5 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [circle5 addTarget:self
                 action:@selector(buttonPressed)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        circle5 = buttons[4];
    }
    [circle5 setFrame:initialCircleFrame5];
    circle5.layer.cornerRadius = 25.0;
    circle5.clipsToBounds = YES;
    [vc.view addSubview:circle5];
    
    
    /* bottom right */
    finalCircleFrame6 = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-tabBarHeight+50, 50, 50);
    initialCircleFrame6 = CGRectMake(DEVICE_SIZE.width+20, DEVICE_SIZE.height+50-tabBarHeight, 50, 50);
    if([buttons count] < 6){
        circle6 = [[UIButton alloc] init];
        circle6.backgroundColor = [UIColor magentaColor];
        [circle6 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
        [circle6 addTarget:self
                 action:@selector(buttonPressed)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        circle6 = buttons[5];
    }
    [circle6 setFrame:initialCircleFrame6];
    circle6.layer.cornerRadius = 25.0;
    circle6.clipsToBounds = YES;
    [vc.view addSubview:circle6];
    
    [self hideMenu];
    
}


+ (void) showMenu
{
    if(!initialized){
        [NSException raise:@"UninitializedMenuException" format:@"Attempting to show menu without first initializing one. [OECentreMenu setupMenuInViewController:withButtons:thatHasTabBar:] or [OECentreMenu setupMenuInViewController:thatHasTabBar:] must be called before menu can be shown."];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        menuBackground.frame = finalMenuFrame;
    }];
    
    [self runSpinAnimationOnView:circle duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        //circle.frame = finalCircleFrame;
        [circle setFrame:finalCircleFrame];
    } completion:^(BOOL finished) {
        [circle.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle2 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle2.frame = finalCircleFrame2;
    } completion:^(BOOL finished) {
        [circle2.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle3 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle3.frame = finalCircleFrame3;
    } completion:^(BOOL finished) {
        [circle3.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle4 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle4.frame = finalCircleFrame4;
    } completion:^(BOOL finished) {
        [circle4.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle5 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle5.frame = finalCircleFrame5;
    } completion:^(BOOL finished) {
        [circle5.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle6 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle6.frame = finalCircleFrame6;
    } completion:^(BOOL finished) {
        [circle6.layer removeAllAnimations];
    }];
}


+ (void) hideMenu
{
    if(!initialized){
        [NSException raise:@"UninitializedMenuException" format:@"Attempting to hide menu without first initializing one. [OECentreMenu setupMenuInViewController:withButtons:thatHasTabBar:] or [OECentreMenu setupMenuInViewController:thatHasTabBar:] must be called before menu can be hidden."];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        menuBackground.frame = initialMenuFrame;
    }];
    
    [self runSpinAnimationOnView:circle duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        [circle setFrame:initialCircleFrame];
    } completion:^(BOOL finished) {
        [circle.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle2 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle2.frame = initialCircleFrame2;
    } completion:^(BOOL finished) {
        [circle2.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle3 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle3.frame = initialCircleFrame3;
    } completion:^(BOOL finished) {
        [circle3.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle4 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle4.frame = initialCircleFrame4;
    } completion:^(BOOL finished) {
        [circle4.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle5 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle5.frame = initialCircleFrame5;
    } completion:^(BOOL finished) {
        [circle5.layer removeAllAnimations];
    }];
    
    [self runSpinAnimationOnView:circle6 duration:3 rotations:4 repeat:HUGE_VALF];
    [UIView animateWithDuration:0.4 animations:^{
        circle6.frame = initialCircleFrame6;
    } completion:^(BOOL finished) {
        [circle6.layer removeAllAnimations];
    }];
}



+ (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

+ (void) buttonPressed
{
    NSLog(@"OECentreMenu: BUTTON PRESSED!!!");
}


+ (void) updateFrames
{
    int tabBarHeight;
    
    if(vcStore.tabBarController.tabBar.hidden){
        tabBarHeight = 0;
    }
    else{
        tabBarHeight = 49;
    }
    
    initialMenuFrame = CGRectMake((DEVICE_SIZE.width/2), (DEVICE_SIZE.height/2)-tabBarHeight, 1, 1);
    finalMenuFrame = CGRectMake((DEVICE_SIZE.width/2)-80-20, (DEVICE_SIZE.height/2)-tabBarHeight-20, 210, 140);
    
    finalCircleFrame = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-tabBarHeight, 50, 50);
    initialCircleFrame = CGRectMake(-50, -50, 50, 50);
    
    finalCircleFrame2 = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-tabBarHeight, 50, 50);
    initialCircleFrame2 = CGRectMake(80+60, -50, 50, 50);
    
    finalCircleFrame3 = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-tabBarHeight, 50, 50);
    initialCircleFrame3 = CGRectMake(DEVICE_SIZE.width+20, -50, 50, 50);
    
    finalCircleFrame4 = CGRectMake((DEVICE_SIZE.width/2)-80, (DEVICE_SIZE.height/2)-tabBarHeight+50, 50, 50);
    initialCircleFrame4 = CGRectMake(-50, DEVICE_SIZE.height+50-tabBarHeight, 50, 50);
    
    finalCircleFrame5 = CGRectMake((DEVICE_SIZE.width/2)-80+60, (DEVICE_SIZE.height/2)-tabBarHeight+50, 50, 50);
    initialCircleFrame5 = CGRectMake((DEVICE_SIZE.width/2)-80+60, DEVICE_SIZE.height+50, 50, 50);
    
    finalCircleFrame6 = CGRectMake((DEVICE_SIZE.width/2)-80+120, (DEVICE_SIZE.height/2)-tabBarHeight+50, 50, 50);
    initialCircleFrame6 = CGRectMake(DEVICE_SIZE.width+20, DEVICE_SIZE.height+50-tabBarHeight, 50, 50);
    
    
    [menuBackground setFrame:finalMenuFrame];
    [circle setFrame:finalCircleFrame];
    [circle2 setFrame:finalCircleFrame2];
    [circle3 setFrame:finalCircleFrame3];
    [circle4 setFrame:finalCircleFrame4];
    [circle5 setFrame:finalCircleFrame5];
    [circle6 setFrame:finalCircleFrame6];
}


@end
