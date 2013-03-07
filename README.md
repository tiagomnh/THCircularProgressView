# THCircularProgressView

`THCircularProgressView` is a `UIView` subclass with a circular bar useful for illustrating progress.

![Screenshot](Screenshot.png)

## Installation

Drag the contents of `THCircularProgressView/` into your project.

## Usage

`THCircularProgressView` is simply a `UIView` subclass so just instantiate it and add it a view hieararchy. The initializer is:

```objc
- (id)initWithCenter:(CGPoint)center
              radius:(CGFloat)radius
           lineWidth:(CGFloat)lineWidth
        progressMode:(THProgressMode)progressMode
       progressColor:(UIColor *)progressColor
progressBackgroundMode:(THProgressBackgroundMode)backgroundMode
progressBackgroundColor:(UIColor *)progressBackgroundColor
          percentage:(CGFloat)percentage
```

It supports two kinds of progress mode:
* `THProgressModeFill` - starts empty and gets filled as percentage increases;
* `THProgressModeDeplete` - starts full and depletes as percentage increases;

The sample project in `/Demo` contains some examples.

## License

THCircularProgressView is available under the MIT license. See the LICENSE file for more info.
