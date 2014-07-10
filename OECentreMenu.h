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

@interface OECentreMenu : NSObject

/**
 * Initializes and arranges the Centre Menu.
 * Either this method or @b setupMenuInViewController:thatHasTabBar:  needs to be called before menu can be shown or hidden.
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
+ (void) setupMenuInViewController:(UIViewController *)vc withButtons:(NSArray *)buttons thatHasTabBar:(BOOL) hasTabBar;


/**
 * Initializes and arranges the Centre Menu with default buttons.
 * Either this method or @b setupMenuInViewController:withButtons:thatHasTabBar:
 * need to be called before the Menu can be shown or hidden.
 *
 * @param vc The View Controller within which the Menu is to be displayed.
 * @param hasTabBar A boolean flag that signifies whether there is a tab bar or bottom toolbar
 * on vc so the method knows whether to take this into account when centering the menu.
 *
 */
+ (void) setupMenuInViewController:(UIViewController *)vc thatHasTabBar:(BOOL) hasTabBar;



/**
 * This method removes the CentreMenu and its buttons from whatever view controller(s) it is
 * currently on.
 *
 * It should be called when leaving a view controller within the view lifecycle methods
 * @a viewWillDisappear or @a viewDidDisappear.
 *
 */
+ (void) removeMenuFromViewController;


/**
 * Animates the Menu into display.
 *
 * The Menu must first have been initialized at some point by calling either
 * @b setupMenuInViewController:thatHasTabBar:  or 
 * @b setupMenuInViewController:withButtons:thatHasTabBar:
 * Otherwise, this method will throw an Exception.
 */
+ (void) showMenu;


/**
 * Animates the Menu out of display.
 *
 * The Menu must first have been initialized at some point by calling either
 * @b setupMenuInViewController:thatHasTabBar:  or
 * @b setupMenuInViewController:withButtons:thatHasTabBar:
 * Otherwise, this method will throw an Exception.
 */
+ (void) hideMenu;


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
+ (void) updateFrames;


/**
 * Changes the tint colour of the Menu background.
 *
 * @param color The new color to be set to the Menu background.
 *
 */
+ (void) setMenuBackgroundColor:(UIColor *)color;









@end
