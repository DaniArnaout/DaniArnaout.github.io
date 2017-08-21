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

`ALTableView` & `ALCollectionView` has a new delegate designed for status update. These are `<ALTableViewLoading>`

---

### Can I have different number of columns in a collection view according to different device types and orientation?

---

### How do I know if any error occurs while loading the table/collection?

---


### Do I have access to the JSON response data if I need to extract any values?

---


### Can I pass dynamic parameters to the table/collection view?

---

### Can I have a collection view inside a table view inside a table view?

---


### How do I push data from the selected table view cell to the next view controller?

---

### Can I use XIBs instead of storyboard?

---

### How do I add a loader to image? Are there any callbacks?

---

### Are there any special call back methods added for table/collection view?

---

### Can I use Abstract Layer table view inside a UITableViewController?

---

### Can I add an ‘edit’ or ‘delete’ option in a table/collection view?

---

### Can I add headers and footers to the table?

---


### Can I display multiple sections each with a different cell prototype out of the same JSON?

---

### Can I re-arrange table/collection view cells?

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

---