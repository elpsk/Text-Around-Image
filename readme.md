## NSTextContainer example


Draw a text using an UITextView along an UIImage



```
- ( void ) drawText
{
    _myTextView.text = @"Your very long text here...";
 
    UIBezierPath *circle = [ UIBezierPath bezierPathWithOvalInRect: CGRectMake(105, 100, 120, 110) ];

    UIImageView *imageView = [[ UIImageView alloc] initWithFrame:   CGRectMake(110, 110, 100, 102) ];

    [imageView setImage: [UIImage imageNamed: @"yourImage.png"]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    [_myTextView addSubview: imageView];

    _myTextView.textContainer.exclusionPaths = @[circle];
}
```


Full article here: http://www.albertopasca.it/whiletrue/2013/10/objc-draw-text-along-uiimage/


