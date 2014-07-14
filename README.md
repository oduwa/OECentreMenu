OECentreMenu
============

A simple drag and drop solution for an animated menu in the centre of the screen.

![alt tag](http://media.tumblr.com/62b2088d895724bd64d51e321dcdfb59/tumblr_inline_n8gxdo0NVt1sbglrf.gif)



## Initialization ##
The menu can be initialized in different ways depending on your preferences. The two initialization methods are 
```[OECentreMenu initInViewController:withButtons:thatHasTabBar:]``` and ```[OECentreMenu initInViewController: withButtons:andVerticalOffset:]```. Examples are shown below:

```smalltalk
OECentreMenu *menu = [[OECentreMenu alloc] initInViewController:self withButtons:nil thatHasTabBar:YES];
```

or

```smalltalk
OECentreMenu *menu = [[OECentreMenu alloc] initInViewController:self withButtons:nil andVerticalOffset:90];
```

The argument for *thatHasTabBar* is a boolean value that signifies whether there is a tab bar or bottom toolbar
on the view controller upon which the menu is to be displayed. This lets the method know whether to take this into account when centering the menu.

The argument for *andVerticalOffset* is a float value to offset the vertical position of the menu by. A positive value
moves the menu up and a negative value moves it down.

Notice that in the above examples, the "withButtons:" argument is nil. The above styles of initialization do not specify any buttons for the menu or what the buttons should do. Instead, defaults buttons are placed. You may provide your own buttons or override the defaults. You will probably need to provide your own buttons. An example is shown below:


```smalltalk
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

OECentreMenu *menu = [[OECentreMenu alloc] initInViewController:self withButtons:buttons thatHasTabBar:YES];

// Alternatively the line below can be used to specify the vertical offset of the Menu
//OECentreMenu *menu = [[OECentreMenu alloc] initInViewController:self withButtons:buttons andVerticalOffset:90];
```
Don't forget to replace "quaver.png" with whatever image you have/want.

You also do not have to provide 6 buttons. You may provide any number of buttons. Any buttons you do not provide will be replaced with the default placeholder.

## Usage ##
To display the menu, call:
```smalltalk
// myMenu is an instance of OECentreMenu (which i suggest should be a private instance variable).
[myMenu show];
```
To hide the menu, call:
```smalltalk
// myMenu is an instance of OECentreMenu (which i suggest should be a private instance variable).
[myMenu hide];
```

### Device Rotation ###

If your View Controller supports device rotation, you may want the menu to rotate with the rest of the screen.
To accomplish this, implement the delegate method -(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
within the View Controller making use of the menu. An example is shown below:

```smalltalk
// myMenu is an instance of OECentreMenu (which i suggest should be a private instance variable).
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [myMenu updateFramesAfterDeviceRotation];
}
```

** WARNING: Calling this method within -(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation:duration:(NSTimeInterval)duration on the other hand, will not have any effect.**
 

### Customization ###

The background of the menu can be hidden by calling the ```setShowsBackgroundFrame:(BOOL)hasFrame``` method. Setting *hasFrame* to NO hides the background of the Menu.



## Compatibility ##

Tested and working on iOS 6.1+

## Credits ##

Special thanks to Nick Lockwood. I used his [FXBlurView](https://github.com/nicklockwood/FXBlurView).

That's all folks!







