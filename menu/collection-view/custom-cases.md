# Custom cases

> Learn how fully customizable a collection view

This tutorial covers the following customizations:

* [UI customization](../../menu/collection-view/custom-cases?id=ui-customization)
* [Conditionals](../../menu/collection-view/custom-cases?id=conditionals)
* [Re-order cells](../../menu/collection-view/custom-cases?id=re-order-cells)
* [Pass data between view controllers](../../menu/collection-view/custom-cases?id=pass-data-between-view-controllers)
* [Status](../../menu/collection-view/custom-cases?id=status)

By now, this looks magical, but what if you want to customize any of the elements or data?

It's very simple. Abstract Layer subclasses from UIKit classes directly without messing around with the initial implementation. 

You can simply subclass any of Abstract Layer's classes and do your own customization.
Even better, you can set the table view delegate & datasource to any of your own objects!

## UI customization 
**Example**: Add a thick red border to `ALImageView`.

<img width="300" alt="Xcode" src="/menu/collection-view/attachments/collection-view-custom-border.png">

For that you can do either:
Subclass `UICollectionViewCell` and do you UI customizations
Subclass `ALImageView` and do your UI customizations.

We'll go with the second option, since it involves modifying a Abstract Layer component.

Choose "File" → "New" → "File" from Xcode's menu bar

Choose `Cocoa Touch Class`, call it `CustomImageView` and subclass it from `ALImageView`

<img width="300" alt="Xcode" src="/menu/collection-view/attachments/collection-view-custom-class.png">

In your storyboard, click on the image view and change its subclass to `CustomImageView`

<img width="500" alt="Xcode" src="/menu/collection-view/attachments/collection-view-custom-view.png">

Head to your CustomImageView.h and import Abstract Layer instead of UIKit

```Swift
import AbstractLayer
```

```Objective-C
#import <AbstractLayer/ALImageView.h>
```

Head to your CustomImageView.m and override layoutSubviews with the code that adds a red border

```Swift
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let redColor = UIColor.red
    layer.borderColor = redColor.cgColor
    layer.borderWidth = 4.0
  }
```

```Objective-C
- (void)layoutSubviews {
  [super layoutSubviews];
   
  self.layer.borderColor = [UIColor redColor].CGColor;
  self.layer.borderWidth = 4.0f;
}
```

That's it. Just run your project, and see for yourself!

## Conditionals

Assume you want to have a collection with alternate row colors (First row with white background, second with blue, third with white, and so on).
This is exactly the same way you would do it without Abstract Layer. Simply set one of your objects as the datasource of `ALCollectionView` and implement the following method:

```Swift  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.cellForItem(at: indexPath)
    
    if indexPath.row % 2 == 0 {
      cell?.contentView.backgroundColor = UIColor.blue
    } else {
      cell?.contentView.backgroundColor = UIColor.white
    }
    
    return cell!
  }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let items = collectionView.numberOfItems(inSection: section)
    return items
  }
```

```Objective-C
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
 
  if (indexPath.row %2) {
    cell.contentView.backgroundColor = [UIColor whiteColor];
  } else {
    cell.contentView.backgroundColor = [UIColor blueColor];
  }
  return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [collectionView numberOfItemsInSection:section];
}
```

> **Notice**: Instead of calling `dequeueReusableCellWithIdentifier:` to get an empty cell, call `cellForRowAtIndexPath` to get the cell with all data inside.
Now, feel free to modify anything within the cell, and make sure you return it. It's as simple as that.

> **Notice**: If you want to modify `cellForItemAtIndexPath` then you must also copy/paste `numberOfItemsInSection` to fully conform to the `dataSource` protocol.
> 
## Re-order cells
Just like what you saw in the previous example, you can implement any delegate or datasource method to achieve custom results.
For example, if you want to integrate re-ordering, that is done automatically as soon as you allow it.
To allow re-ordering, use this code:

```Swift
func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
  // Do any custom wrok here
  }
```

```Objective-C
- (void)collectionView:(UIcollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
  [collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
  // Do any custom wrok here
}
```

After that, implement any extra customization code.

## Pass data between view controllers
`ALCollectionView` has an `array` property, which is an array of dictionary of the JSON object. Just pass the portion of data you need and use it in other View Controllers.

```Swift
collectionview.array
```

```Objective-C
self.collectionview.array
```

## Status
To add your custom work for when the table is going to load or after loading items, simply conform to the delegate `<ALCollectionViewLoadingDelegate>` in `ALCollectionView` and implement the any of the optional methods:

This delegate provides two optional protocols for will/did load.

```Swift
func willLoadCollectionView()
  
func didLoadCollectionViewWithError(_ error: Error!)
```

```Objective-C
- (void)willLoadCollectionView;

- (void)didLoadCollectionViewWithError:(NSError *)error;
```

Set `loadingDelegate` to one of your classes, then implement any of those methods accordingly.

Example:

```Swift
collectionview.loadingDelegate = self
``` 

```Objective-C
self.collectionview.loadingDelegate = self;
``` 