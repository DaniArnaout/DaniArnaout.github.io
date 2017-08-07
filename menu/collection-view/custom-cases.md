# Custom cases

> Learn how fully customizable Collection View is

This tutorial covers the following customizations:

1. UI customization 
2. Conditionals
3. Re-order cells
4. Pass data between view controllers
5. Status

By now, this looks magical, but what if you want to customize any of the elements or data?

It's very simple. Codepack subclasses from UIKit classes directly without messing around with the initial implementation. You can simply subclass any of Codepack's classes and do your own customization.

## UI customization 
**Example**: Add a thick red border to CPImageView.

<img width="300" alt="Xcode" src="/menu/collection-view/attachments/collection-view-custom-border.png">

For that you can do either:
Subclass `UICollectionViewCell` and do you UI customizations
Subclass `CPImageView` and do your UI customizations.

We'll go with the second option, since it involves modifying a Codepack component.

Choose "File" → "New" → "File" from Xcode's menu bar

Choose `Cocoa Touch Class`, call it `CustomImageView` and subclass it from `CPImageView`

<img width="300" alt="Xcode" src="/menu/collection-view/attachments/collection-view-custom-class.png">

In your storyboard, click on the image view and change its subclass to `CustomImageView`

<img width="500" alt="Xcode" src="/menu/collection-view/attachments/collection-view-custom-view.png">

Head to your CustomImageView.h and import Codepack instead of UIKit
`#import <Codepack/CPImageView.h>`

Head to your CustomImageView.m and override layoutSubviews with the code that adds a red border

```objective-c
- (void)layoutSubviews {
  [super layoutSubviews];
   
  self.layer.borderColor = [UIColor redColor].CGColor;
  self.layer.borderWidth = 4.0f;
}
```

That's it. Just run your project, and see for yourself!

## Conditionals

Assume you want to have a collection with alternate row colors (First row with white background, second with blue, third with white, and so on).
This is exactly the same way you would do it without Codepack. Simply override

```objective-c
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
  UICollectionViewCell *cell = [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
 
  if (indexPath.row %2) {
    cell.contentView.backgroundColor = [UIColor whiteColor];
  } else {
    cell.contentView.backgroundColor = [UIColor blueColor];
  }
  return cell;
}
```

> Notice: Instead of calling `dequeueReusableCellWithIdentifier:` to get an empty cell, call super to get the cell with all data inside.
Now, feel free to modify anything within the cell, and make sure you return it. It's as simple as that.

## Re-order cells
Just like what you saw in the previous example, you can override any delegate or datasource method to achieve custom results.
For example, if you want to integrate re-ordering, that is done automatically as soon as you allow it.
To allow re-ordering, use this code:

```objective-c
- (void)collectionView:(UIcollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
  [super collectionView:collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}
```

After that, implement any extra customization code.

## Pass data between view controllers
CPcollectionViewController has an array property, which is an array of NSDictionary of the JSON object. Just pass the portion of data you need and use it in other View Controllers.

## Status
To add your custom work for when the collection is going to load or after loading items, simply override the following methods in CPCollectionViewController's subclass accordingly:

```objective-c
- (void)willLoadCollectionView;
- (void)didLoadCollectionViewWithError:(NSError *)error;
```