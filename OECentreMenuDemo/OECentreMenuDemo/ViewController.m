//
//  ViewController.m
//  OECentreMenuDemo
//
//  Created by Odie Edo-Osagie on 05/04/2015.
//  Copyright (c) 2015 Odie Edo-Osagie. All rights reserved.
//

#import "ViewController.h"
#import "OECentreMenu.h"

@interface ViewController (){
    OECentreMenu *myMenu;
    BOOL isMenuShowing;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // menu setup
    [self setupMenu];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupMenu
{
    UIButton *button1 = [[UIButton alloc] init];
    [button1 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    button1.backgroundColor = [UIColor colorWithRed:26.0/256 green:188.0/256 blue:156.0/256 alpha:1.0];
    
    UIButton *button2 = [[UIButton alloc] init];
    [button2 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor colorWithRed:52.0/256 green:152.0/256 blue:219.0/256 alpha:1.0];
    
    UIButton *button3 = [[UIButton alloc] init];
    [button3 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    button3.backgroundColor = [UIColor colorWithRed:246.0/256 green:71.0/256 blue:71.0/256 alpha:1.0];
    
    UIButton *button4 = [[UIButton alloc] init];
    [button4 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    button4.backgroundColor = [UIColor colorWithRed:241.0/256 green:196.0/256 blue:15.0/256 alpha:1.0];
    
    UIButton *button5 = [[UIButton alloc] init];
    [button5 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    button5.backgroundColor = [UIColor colorWithRed:155.0/256 green:89.0/256 blue:182.0/256 alpha:1.0];
    
    UIButton *button6 = [[UIButton alloc] init];
    [button6 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    button6.backgroundColor = [UIColor colorWithRed:253.0/256 green:227.0/256 blue:167.0/256 alpha:1.0];
    
    NSArray *buttons = @[button1, button2, button3, button4, button5, button6];
    
    myMenu = [[OECentreMenu alloc] initInViewController:self withButtons:buttons andVerticalOffset:64];
}

- (void) buttonPressed
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Yay!"
                                                    message:@"You selected a menu item! You may navigate to another page or whatever else you like!"
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
    [alert show];
}

- (IBAction)leftBarButtonPressed:(id)sender
{
    if(!isMenuShowing){
        [myMenu show];
        isMenuShowing = YES;
    }
    else{
        [myMenu hide];
        isMenuShowing = NO;
    }
}



@end
