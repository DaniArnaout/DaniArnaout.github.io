# FAQ

> This section has answers to all your technical questions about Abstract Layer

### Can I modify the table/collection view cell UI by code?

**Yes.**

UITableViewCell & UICollectionViewCell are left untouched. You can simply subclass them and link your UI elements, just like what you used to do.
Inside `awakeFromNib` in your subclass, do any UI changes programatically.

```Objective-C
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
```

---

### Can I modify a label’s text before displaying it (Ex: If JSON returns `price` in USD and I want to display it in EUR)

**Yes.**

You have full access to both the UI elements in the cell, and to the JSON array.
The recommended way is doing it in `cellForRowAtIndex`.
The only difference is, you should call:

```Objective-C
UITableViewCell ###cell = [tableView cellForRowAtIndexPath:indexPath];
```
instead of calling:

```Objective-C
UITableViewCell ###cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
```

Which will return the final cell that has all the data inside.
Now, you can change any value you need.

```Objective-C
- (UITableViewCell ###)tableView:(UITableView ###)tableView cellForRowAtIndexPath:(NSIndexPath ###)indexPath {
  CustomTableViewCell ###cell = [tableView cellForRowAtIndexPath:indexPath];
  
  // Convert from USD to EUR
  CGFloat price = cell.priceLabel.text.floatValue; // Price in USD
  price = price ### 0.85; // Convert to EUR
  cell.priceLabel.text = [NSString stringWithFormat:@"%.2f",price]; // Set new value
  
  return cell;
}
```

---

### Can I implement the native delegate & datasource methods?

**Yes.**

You can simply set the delegate or datasource of `ALTableView` or `ALCollectionView` to any of your own classes.

**NOTE:**

**Delegate:** If you set your own class to be the delegate, make sure you also copy/paste this method:

Table View:

```Objective-C
- (CGFloat)tableView:(UITableView ###)tableView heightForRowAtIndexPath:(NSIndexPath ###)indexPath {
  return [(ALTableView ###)tableView heightForRowAtIndexPath:indexPath];
}
```

Collection View:

```Objective-C
- (CGSize)collectionView:(UICollectionView ###)collectionView layout:(UICollectionViewLayout ###)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath ###)indexPath {
  return [(ALCollectionView ###)collectionView sizeForItemAtIndexPath:indexPath];
}
```
**DataSource:** If you set your own class to be the dataSource, make sure you also copy/paste these method:

Table View:

```Objective-C
- (NSInteger)tableView:(UITableView ###)tableView numberOfRowsInSection:(NSInteger)section {
  return [tableView numberOfRowsInSection:section];
}

- (UITableViewCell ###)tableView:(UITableView ###)tableView cellForRowAtIndexPath:(NSIndexPath ###)indexPath {
  UITableViewCell ###cell = [tableView cellForRowAtIndexPath:indexPath];
  // Optional: Add your custom code here
  return cell;
}
```

Collection View:

```Objective-C
- (NSInteger)collectionView:(UICollectionView ###)collectionView numberOfItemsInSection:(NSInteger)section {
  return [collectionView numberOfItemsInSection:section];
}

- (UICollectionViewCell ###)collectionView:(UICollectionView ###)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath ###)indexPath {
  UICollectionViewCell ###cell = [collectionView cellForItemAtIndexPath:indexPath];
  // Optional: Add your custom code here
  return cell;
}
```

---

### How do I know if the table/collection has loaded?

`ALTableView` & `ALCollectionView` has a new delegate designed for status update. These are `<ALTableViewLoadingDelegate>` and `<ALCollectionViewLoadingDelegate>`

Each delegate provides two optional protocols for will/did load.

Table View:

```Objective-C
- (void)willLoadTableView;

- (void)didLoadTableViewWithError:(NSError *)error;
```

Collection View:

```Objective-C
- (void)willLoadCollectionView;

- (void)didLoadCollectionViewWithError:(NSError *)error;
```
Set `loadingDelegate` to one of your classes, then implement any of those methods accordingly.

Example:

```Objective-C
self.tableView.loadingDelegate = self;
``` 
And

```Objective-C
self.collectionView.loadingDelegate = self;
``` 

---

### Can I have different number of columns in a collection view according to different device types and orientation?

**Yes.**

From your attribute inspector, just choose the number of columns for each device.

The available options are:

* iPhone portrait
* iPhone landscape
* iPad portrait
* iPad landscape

<img width="300" alt="Xcode" src="../../menu/faq/attachements/columns.png">

---

### How do I know if any error occurs while loading the table/collection?

`ALTableView` & `ALCollectionView` has a new delegate designed for status update. These are `<ALTableViewLoadingDelegate>` and `<ALCollectionViewLoadingDelegate>`

Each delegate provides an optional protocols to know when your view loads.

Table View:

```Objective-C
- (void)didLoadTableViewWithError:(NSError *)error;
```

Collection View:

```Objective-C
- (void)didLoadCollectionViewWithError:(NSError *)error;
```

Set `loadingDelegate` to one of your classes, then implement this method.
If the `error` object is empty, then no error occured.
Otherwise, you can print out the `error.localizedString` to check for the error details.

---

### Do I have access to the JSON response data if I need to extract any values?

**Yes.**

Within your `ALTableView` or `ALCollectionView` instance, there's a property called `array`. This represents the parsed array of models that populates your view.

```Objective-C
self.collectionView.array
self.tableView.array
```

---


### Can I pass dynamic parameters to the table/collection view?

**Yes.**

Check out the `Parameters` section in the guide.

[Parameters for table view.](../../menu/table-view/parameters)

[Parameters for collection view.](../../menu/collection-view/parameters)

---

### Can I have a collection view inside a table view inside a table view?

**Yes.**

Not sure why would you need that, but yes, you can do that.

Each instance of `ALTableView` or `ALCollectionView` is a separate entity, so you can simply have as much of those in 1 view controller.

Just implement each one by setting its attribute from the attribute inspector, and you're ready!

---


### How do I push data from the selected table view cell to the next view controller?

Within your `ALTableView` or `ALCollectionView` instance, there's a property called `array`. This represents the parsed array of models that populates your view.

For example, here's how you push the data of the cell the user has just tapped:

```Objective-C
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *item = self.tableView.array[indexPath.row];
  // You're good to go.
}
```

---

### Can I use XIBs instead of storyboard?

**Yes.**

Refer to the guide about XIB.

[XIB for table view.](../../menu/table-view/xib)

[XIB for collection view.](../../menu/collection-view/xib)

---

### How do I add a loader to image?

Simply, click on your `ALImageView` and head to your attribute inspector.

Turn on the loader to `ON` and pick a color for your loader.
<img width="300" alt="Xcode" src="../../menu/faq/attachements/loader.png">

---

### Can I use Abstract Layer table view inside a UITableViewController?

**Yes.**

Simply, click on the table view inside the `UITableViewController` that you drag to your storyboard and set its class to `ALTableView`, and there you go.

<img width="500" alt="Xcode" src="../../menu/faq/attachements/tableview-class.png">

---

### Can I add an ‘edit’ or ‘delete’ option in a table/collection view?

**Yes.**

Copy/paste the following methods, and you'll be set. Abstract Layer handle deleting the cells and their corresponding data from the datasource.

```Objective-C
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
```

```Objective-C
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  [(ALTableView *)tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}
```
---

### Can I add headers and footers to the table?

**Yes.**

Abstract Layer doesn't modify anything related to headers or footers, so just do it the regular way by dragging a view on top of your `UITableView` in storybaord, or do it by code.

---


### Can I display multiple sections each with a different cell prototype out of the same JSON?

---

### Can I re-arrange table/collection view cells?

**Yes.**



---

### Can I use a base url instead of having to retype the server address overtime?

---

### Can I have different cell heights in collection view (Pinterest UI)?

---

### Do you cache images? And how does it work?

---

### Does Abstract Layer use any 3rd party dependencies?

---

### What is the size of the framework

---

### Can I subclass the ALTableView/ALCollectionView to do my own customization? 

---

### How do I know if there’s a parsing error in a table?

---


### How do I know if there’s a URL or server error in a table/collection?

---

### Can I implement force touch on a cell?

---


### Does the table view support different encodings for different http methods?

---

### What do you use to handle network requests? Is it native NSURLSession or any other 3rd party library?

---

### What if my JSON document is a local file?

If you JSON document is a local file (in your app bundle), add its name in the URL section, and that's it. Abstrac Layer will process it just like it was downloaded from an API.

<img width="300" alt="Xcode" src="../../menu/faq/attachements/local-json.png">

---