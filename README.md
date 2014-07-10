OECentreMenu
============

A simple drag and drop solution for an animated menu in the centre of the screen.

![alt tag](http://media.tumblr.com/62b2088d895724bd64d51e321dcdfb59/tumblr_inline_n8gxdo0NVt1sbglrf.gif)



## Initialization ##
The Menu must first be initialized by calling either

```smalltalk
[OECentreMenu setupMenuInViewController:self thatHasTabBar:YES];
```

or

```Objective-C
[OECentreMenu setupMenuInViewController:self withButtons:nil thatHasTabBar:YES];
```
The argument for *thatHasTabBar* is a boolean value that signifies whether there is a tab bar or bottom toolbar
on the view controller upon which the menu is to be displayed. This lets the method know whether to take this into account when centering the menu.

The above styles of initialization do not specify any buttons for the menu or what the buttons should do. Instead, defaults buttons are placed. You may provide your own buttons or override the defaults. It is better to provide your own buttons. An example is shown below:

```Objective-C
UIButton *button1 = [[UIButton alloc] init];
[button1 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
[button1 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
button1.backgroundColor = [UIColor redColor];

      . . .

UIButton *button6 = [[UIButton alloc] init];
[button6 setBackgroundImage:[UIImage imageNamed:@"quaver.png"] forState:UIControlStateNormal];
[button6 addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
button6.backgroundColor = [UIColor yellowColor];

NSArray *myButtons = @[button1, button2, button3, button4, button5, button6];

[OECentreMenu setupMenuInViewController:self withButtons:myButtons thatHasTabBar:YES];
```
Don't forget to replace "quaver.png" with whatever image you have/want.

You also do not have to provide 6 buttons. You may provide any number of buttons. Any buttons you do not provide will be replaced with the default placeholder.

## Usage ##
To display the menu, call:
```Objective-C
[OECentreMenu showMenu];
```
To hide the menu, call:
```Objective-C
[OECentreMenu hideMenu];
```

## Using With Multiple View Controllers ##
The OECentreMenu is a single class instance and so in any view controller that makes use of it, the *viewDidDisappear* or *viewWillDisappear* methods must be implemented, and ```[OECentreMenu hideMenu]``` must be called within it.

*viewDidAppear* or *viewWillAppear* must also be implemented and the OECentreMenu should be initialized in there.

This must be done for **EVERY** View Controller that uses OECentreMenu. An example is shown below:

```Objective-C
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [OECentreMenu setupMenuInViewController:self withButtons:nil thatHasTabBar:YES];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [OECentreMenu hideMenu];
}
```









