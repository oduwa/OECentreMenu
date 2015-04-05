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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OECentreMenu : NSObject

/* MENU BACKGROUND */
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *regularBackgroundView;
@property (nonatomic, strong) UIView *blurredBackgroundView;
@property (nonatomic, assign) CGRect initialBackgroundFrame;
@property (nonatomic, assign) CGRect finalBackgroundFrame;

/* FIRST MENU ITEM */
@property (nonatomic, strong) UIButton *item1;
@property (nonatomic, assign) CGRect initialItem1Frame;
@property (nonatomic, assign) CGRect finalItem1Frame;

/* SECOND MENU ITEM */
@property (nonatomic, strong) UIButton *item2;
@property (nonatomic, assign) CGRect initialItem2Frame;
@property (nonatomic, assign) CGRect finalItem2Frame;

/* THIRD MENU ITEM */
@property (nonatomic, strong) UIButton *item3;
@property (nonatomic, assign) CGRect initialItem3Frame;
@property (nonatomic, assign) CGRect finalItem3Frame;

/* FOURTH MENU ITEM */
@property (nonatomic, strong) UIButton *item4;
@property (nonatomic, assign) CGRect initialItem4Frame;
@property (nonatomic, assign) CGRect finalItem4Frame;

/* FIFTH MENU ITEM */
@property (nonatomic, strong) UIButton *item5;
@property (nonatomic, assign) CGRect initialItem5Frame;
@property (nonatomic, assign) CGRect finalItem5Frame;

/* SIXTH MENU ITEM */
@property (nonatomic, strong) UIButton *item6;
@property (nonatomic, assign) CGRect initialItem6Frame;
@property (nonatomic, assign) CGRect finalItem6Frame;

/**
 * The View Controller within which this OECentreMenu is contained.
 */
@property (nonatomic, strong) UIViewController *vc;

/**
 * A boolean flag that signifies whether there is a tab bar or bottom toolbar
 * on vc so the method knows whether to take this into account when centering the menu.
 */
@property (nonatomic, assign) BOOL hasTabBar;

/**
 * A float value to offset the vertical position of the menu by. A positive value
 * moves the menu up and a negative value moves it down.
 */
@property (nonatomic, assign) float centreOffSet_vertical;

/**
 * The colour of the background of the Menu.
 */
@property (nonatomic, strong) UIColor *backgroundColour;

/**
 * The colour of the blur effect of the Menu.
 */
@property (nonatomic, strong) UIColor *transparentTintColour;


/* INITIALIZATION */

/**
 * Initializes and arranges the Centre Menu.
 *
 * @param vc The View Controller within which the Menu is to be displayed.
 * @param buttons An array of UIButton objects to be placed within the menu.
 * The UIButton at index 0 is for the button at the top left, 1 is for top center,
 * and 5 is for bottom right. The array may be nil, empty or contain less than 6 buttons.
 * In such a scenario, default buttons are created.
 * @param yValue A float value to offset the vertical position of the menu by. A positive value
 * moves the menu up and a negative value moves it down.
 *
 */
- (id) initInViewController: (UIViewController *)vc withButtons:(NSArray *)buttons andVerticalOffset: (float)yValue;

/**
 * Initializes and arranges the Centre Menu.
 *
 * @param vc The View Controller within which the Menu is to be displayed.
 * @param buttons An array of UIButton objects to be placed within the menu.
 * The UIButton at index 0 is for the button at the top left, 1 is for top center,
 * and 5 is for bottom right. The array may be nil, empty or contain less than 6 buttons.
 * In such a scenario, default buttons are created.
 * @param hasTabBar A boolean flag that signifies whether there is a tab bar or bottom toolbar
 * on vc so the method knows whether to take this into account when centering the menu.
 *
 */
- (id) initInViewController: (UIViewController *)vc withButtons: (NSArray *)buttons thatHasTabBar: (BOOL) hasTabBar;



/* PRESENTATION */

/**
 * Animates the Menu into display.
 *
 * The Menu must first have been initialized at some point.
 * Otherwise, this method will throw an Exception.
 */
- (void) show;


/**
 * Animates the Menu out of display.
 *
 * The Menu must first have been initialized at some point.
 * Otherwise, this method will throw an Exception.
 */
- (void) hide;


/**
 * Updates the position of the menu for re-centering after the device has been
 * rotated.
 *
 * To use this method, implement the
 * @a -(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
 * method within the View Controller making use of the menu. This method should
 * then be called within your implementation.
 *
 * @warning Calling this method within
 * @a -(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation@a duration:(NSTimeInterval)duration
 * on the other hand, will not have any effect.
 */
- (void) updateFramesAfterDeviceRotation;



/* SETTERS */

/**
 * Sets whether or not the background of the Menu is visible or not.
 *
 * @param enabled set to NO to hide the background of the Menu.
 *
 */
- (void) setShowsBackgroundFrame:(BOOL) hasFrame;


/**
 * Sets whether or not the background of the Menu should have a blur effect or not.
 *
 * @param enabled set to YES to add a blur effect the background of the menu
 *
 */
- (void) setBackgroundBlurEnabled:(BOOL) enabled;


/**
 * Changes the colour of the background of the Menu.
 *
 *@param backgroundColour the new colour to be set to the Menu background.
 *
 */
- (void) changeBackgroundColour:(UIColor *)backgroundColour;


/**
 * Changes the colour of the blur effect of the Menu.
 *
 *@param backgroundColour the new colour to be set to the blur effect of the Menu background.
 *
 */
- (void) changeTransparentTintColour:(UIColor *)transparentTintColour;





@end
