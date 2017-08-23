# Custom cases

> Learn how fully customizable Table View is

This tutorial covers the following customizations:

* [UI customization](../../menu/table-view/custom-cases?id=ui-customization)
* [Conditionals](../../menu/table-view/custom-cases?id=conditionals)
* [Edit/Delete](../../menu/table-view/custom-cases?id=editdelete)
* [Pass data between view controllers](../../menu/table-view/custom-cases?id=pass-data-between-view-controllers)
* [Status](../../menu/table-view/custom-cases?id=status)

By now, this looks magical, but what if you want to customize any of the elements or data?

It's very simple. Abstract Layer subclasses from UIKit classes directly without messing around with the initial implementation. 

You can simply subclass any of Abstract Layer's classes and do your own customization.
Even better, you can set the table view delegate & datasource to any of your own objects!

## UI customization

**Example**: Add a thick red border to `ALImageView`.

<img width="300" alt="Xcode" src="../menu/table-view/attachments/table-view-custom-border.png">

For that you can do either:

* Subclass `UITableViewCell` and do you UI customizations
* Subclass `ALImageView` and do your UI customizations

We'll go with the second option, since it involves modifying a Abstract Layer component.

* Choose `File` → `New` → `File` from Xcode's menu bar
* Choose a `Cocoa Touch Class`, call it `CustomImageView` and subclass it from `ALImageView`

<img width="600" alt="Xcode" src="../menu/table-view/attachments/table-view-custom-class.png">
* In your storyboard, click on the image view and change its subclass to `CustomImageView`
<img width="600" alt="Xcode" src="../menu/table-view/attachments/table-view-custom-attribute.png">

* Head to `CustomImageView.h` and import Abstract Layer instead of UIKit 
`#import <AbstractLayer/ALImageView.h>`

* Head to your CustomImageView.m and override layoutSubviews with the code that adds a red border

```objective-c
- (void)layoutSubviews {
  [super layoutSubviews];
   
  self.layer.borderColor = [UIColor redColor].CGColor;
  self.layer.borderWidth = 4.0f;
}
```
That's it. Just run your project, and see for yourself!

## Conditionals
Assume you want to have a table with alternate row colors (First row with white background, second with blue, third with white, and so on).
This is exactly the same way you would do it without Abstract Layer. Simply set one of your objects as the datasource of `ALTableView` and implement the following method:

```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
 
  if (indexPath.row %2) {
    cell.contentView.backgroundColor = [UIColor whiteColor];
  } else {
    cell.contentView.backgroundColor = [UIColor blueColor];
  }
  return cell;
}
```

> **Notice**: Instead of calling `dequeueReusableCellWithIdentifier:` to get an empty cell, call `cellForRowAtIndexPath` to get the cell with all data inside.
Now, feel free to modify anything within the cell, and make sure you return it. It's as simple as that.

## Edit/Delete
Just like what you saw in the previous example, you can implement any delegate or datasource method to achieve custom results.

For example, if you want to integrate re-ordering or deleting cells, all of that is done automatically as soon as you allow it.

```objective-c
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}
```

Abstract Layer will handle deleting the cell with animation from the UI, you just need to implement any extra actions like sending a new request to delete that specific object or re-order it.

```objective-c
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    // Send an API to delete the item from the server
  }
}
```

To allow re-ordering, use this code:

```objective-c
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
  [tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
  // Do any custom work
}
```

After that, implement any extra customization code.

## Pass data between view controllers
`ALTableView` has an `array` property, which is an array of dictionary of the JSON object. Just pass the portion of data you need and use it in other View Controllers.

```objective-c
self.tableview.array
```

## Status
To add your custom work for when the table is going to load or after loading items, simply conform to the delegate `<ALTableViewLoadingDelegate>` in `ALTableView` and implement the any of the optional methods:

This delegate provides two optional protocols for will/did load.

```Objective-C
- (void)willLoadTableView;

- (void)didLoadTableViewWithError:(NSError *)error;
```

Set `loadingDelegate` to one of your classes, then implement any of those methods accordingly.

Example:

```Objective-C
self.tableView.loadingDelegate = self;
``` 

## Where to go next?
Check out how awesome [collection view](/menu/collection-view/) is