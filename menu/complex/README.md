<div>
<span class="right-note">15 minutes tutorial</span>
 <h1>Collection View inside a Table View</h1>
</div>

**Build a complex API-backed collection inside a table in minutes, right from Interface Builder!**

**Example:** Messenger-like app

**API URL**: [https://api.abstractlayer.com/demo/complex/get_contacts_and_messages](https://api.abstractlayer.com/demo/complex/get_contacts_and_messages)

<img width="400" alt="Table view" src="/menu/complex/attachments/complex-final-design.png">

### Integrate the framework

If you haven't already added the framework to your Xcode project, follow [this tutorial](/).

### Build the UI

* Open `Main.storyboard` and delete the default view controller

* Drag an instance of `UITableViewController`
From the menu bar choose:

`Editor → Embed in → Navigation Controller`

* Click on your navigation controller then check the box that says `Is initial View Controller` from the **Attributes Inspector**

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-initial.png">

The table view will have 2 sections (contacts & messages) each is represented by a prototype cell.

Follow the next steps to achieve the following storyboard design:

<img width="300" alt="Table view" src="/menu/complex/attachments/complex-storybaord.png">

**Design messages prototype cell:**

* Click on your prototype cell, and set the `cell identifier` to `messageCell` in the **Attributes Inspector**

* Drag the prototype cell in your storyboard from the bottom to increase its `height to 80`

* Design the tableview's cell to match the design
	
	<img width="300" alt="Table view" src="/menu/complex/attachments/complex-messages-cell.png">
	
	* `UIImageView` for the user image **(size 50x50)**
	* `UILabel` for the name label  **(Font size 13, semibold, black)**
	* `UILabel` for the last message label **(Font size 12, regular, dark gray)**
	* `UILabel` for the date label **(Font size 12, regular, light gray)**
	


* Choose `2 lines` for last message label

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-2-line.png">

* To design the header of the cell, drag another UITableviewCell prototype cell from the **Object Library** and set its cell identifier to `messageHeader`.

* Drag a UILabel to this new header cell and rename it `Messages`

**Design contacts prototype cell:**

* Drag an instance of `UITableViewCell` from the **Object Library** and set its identifier to `contactCell`

* Drag a `UICollectionView` and make it take the full width of the cell.

**Design the collection view cell:**
	
<img width="300" alt="Table view" src="/menu/complex/attachments/complex-contact-cell.png">
	
* `UIImageView` for the user image **(size 50x50)**
* `UILabel` for the name label  **(Font size 12, regular, dark gray)**

* To design the header of the cell, drag another UITableviewCell prototype cell from the **Object Library** and place it on top of the message cell, then set its cell identifier to `contactHeader`.

* Drag a UILabel to this new header cell and rename it `Contacts`
	
### Magic (Auto data-binding)

It's time to bind data between the JSON document and the UI elements.

* Open the URL in a browser [https://api.abstractlayer.com/demo/complex/get_contacts_and_messages](https://api.abstractlayer.com/demo/complex/get_contacts_and_messages)

* Copy the URL

* Go to your storyboard and click on your `UITableView` and change its class to `ALTableView` in the **Identity Inspector**

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-cptable.png">

* Navigate to your **Attributes Inspector**, and you'll find a list of new attributes

* Paste the URL you just copied in the new `Url` field

* Each section has a different `cell identifier`, so type in both separated by a comma. `contactCell,messageCell`

* Each section has its own `header identifier`, so type in both separated by a comma. `contactHeader,messageHeader`

* As for the JSON root, the first section API is handled by the collection view itself, so it must be left empty, which is represented by a dash (-). This means that the first section consists of only 1 row that is not to be handled by the table parsed API itself.

* The second section however, has `messages` as the root of the JSON to be parsed. (Check the API to see how the response looks like), this is why you need to specify it there.
The end result is `-,messages` which means that the first section will be handled elsewhere, while the second section of the table will be handled by the parsed array.

<img width="300" alt="Table view" src="/menu/complex/attachments/complex-altableview.png">

Your table view is now ready to process the API. It's time to match the **JSON keys** with the **UI elements** to fill the data automatically.

<span class="regular-note">The next section applies for both prototype cells, so make sure you apply it on both the contact and message cells.</span>

**User Image**

* Click on your `UIImageView` and change its class to `ALImageView` in the **Identity Inspector**

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpimage.png">

* Type in `image_url` in the `Json Key` field so that Abstract Layer can automatically load the image using its URL value

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-image-url.png">

**Circular Image**

To get a circular user image, turn the `circular` option `ON`. 

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-circular-image.png">

**Name Label**

* Click on the name label and change its class to `ALLabel` in the **Identity Inspector**

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-cplabel.png">

* Type in `name` in the `Json Key` field to automatically match the JSON value with the name label

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-name.png">

**Last Message Label**

* Click on the last message label and change its class to `ALLabel` in the **Attributes Inspector**

* Type in `last_message` in the `Json Key` field

**Date Label**

* Click on the date label and change its class to `ALDateLabel` in the **Attributes Inspector**

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpdate.png">

* Type in `timestamp` in the `Json Key` field

* Type in `MM/dd/yyyy` in the `Output Format` field to get the desired date format displayed. 

<span class="regular-note"> The format should abide by [Apple's DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter) rules</span>

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-date-format.png">

<span class="important-note">Handle any kind of error by checking the <a href="/#/menu/table-view/error-handling" target="_blank">Error handling section</a></span>

<img width="400" alt="Table view" src="/menu/complex/attachments/complex-final-design.png">
 
Run the project, and there you go! MAGIC!

## Hold on

This looks great so far, but we're sure you've got many questions about how far can Abstract Layer go. 

<table style="width:100%">
  <tr style="height:50px">
    <td class="row-text"><b><a href="/#/menu/table-view/error-handling" target="_blank">Error Handling</a></b><p>Handle all kind of errors when loading your table view</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/passing-data" target="_blank">Passing Data</a></b><p>You have FULL access to parsed data, so passing it is very simple</p><br/></td>
    <td class="row-text"><b><a href="/#/menu/table-view/parameters" target="_blank">Parameters</a></b><p>Be it Header or Body, Static or Dynamic, it's all in Interface Builder</p><br/></td> 
  </tr>

  <tr>
    <td class="row-text"><b><a href="/#/menu/table-view/pagination" target="_blank">Pagination</a></b><p>Enabling pagination takes less than a minute</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/parsing" target="_blank">Complex JSON</a></b><p>Any form of JSON is supported, no matter how complex it is</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/loader" target="_blank">Loader</a></b><p>Enable loaders and pull-to-refresh with 2 clicks</p><br/></td> 
  </tr>
</table>

**The example below shows how you can fully customize the table view example by modifying the parsed data before displaying it.**

### Display "Today" & "Yesterday" instead of full "MM/dd/yyyy" date

<span class="important-note"> Remember: **ALTableView** is a subclass of **UITableView**<span>

<span class="important-note"> Remember: You have FULL access to the data parsed by accessing the **array** property on your Table view</span>


* Create a new class, call it `CustomTableViewCell`

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-custom-cell-class.png">

* Set the Table view cell class to `CustomTableViewCell`

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-custom-tableviewcell-class.png">

* Control-drag your date label to the class as a new outlet and call it `dateLabel`

* Don't forget to import `AbstractLayer` to the class's header

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-link-date.png">

* Create a new class, call it `TableViewController` and subclass it form `UITableViewController`

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-subclass-uitableviewcontroller.png">

* Set your table view class in storyboard to `TableViewController`

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-custom-tableviewcontroller-class.png">

* Download the <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/demo/complex/TableViewController.swift">TableViewController class</a> **OR** replace the content of the class with the following:

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV" style="background-color:rgb(248,248,248);">
<pre><code>
import UIKit
import AbstractLayer

class TableViewController: UITableViewController {
  
  //
  // MARK: Lazy load
  //
  private lazy var today:Double = {
    var calendar = NSCalendar.current
    calendar.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone
    return calendar.startOfDay(for: Date()).timeIntervalSince1970
  }()
  
  private lazy var yesterday:Double = {
    var calendar = NSCalendar.current
    calendar.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone
    return calendar.startOfDay(for: Date().addingTimeInterval(-86400)).timeIntervalSince1970
  }()
  
  //
  // MARK: Table view datasource
  //
  override func tableView(&#95; tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let table = tableView as! ALTableView
    
    if (indexPath.section == 0) {
      return table.cellForRow(at: indexPath)!
    }
    
    let cell = table.cellForRow(at: indexPath) as! CustomTableViewCell
    
    // Get item info
    let array = table.array[1] as! [[String:Any]]
    let item = array[indexPath.row] // Get item dictionary
    let timestamp = item["timestamp"] as! Double
    
    // Date calculations
    if timestamp > today {
      cell.dateLabel?.text = "Today"
    } else if timestamp > yesterday {
      cell.dateLabel?.text = "Yesterday"
    }
    
    return cell
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return tableView.numberOfSections
  }
  
  override func tableView(&#95; tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableView.numberOfRows(inSection: section)
  }
  
  override func tableView(&#95; tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let table = tableView as! ALTableView
    return table.heightForRow(at: indexPath)
  }
  
  override func tableView(&#95; tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let table = tableView as! ALTableView
    return table.viewForHeader(inSection: section)
  }

}

</code></pre>
</div>


<div style="display:none; background-color:rgb(248,248,248);" class="objcDIV">
<pre><code>
#import "TableViewController.h"
#import &lt;AbstractLayer/AbstractLayer.h&gt;
#import "CustomTableViewCell.h"

@interface TableViewController ()
@property (nonatomic, assign) NSTimeInterval today,yesterday;
@end

@implementation TableViewController

//
// UITableView Datasource
//
- (NSInteger)tableView:(UITableView &#42;)tableView numberOfRowsInSection:(NSInteger)section {
  return [tableView numberOfRowsInSection:section];
}

- (UITableViewCell &#42;)tableView:(UITableView &#42;)tableView cellForRowAtIndexPath:(NSIndexPath &#42;)indexPath {
  
  CustomTableViewCell &#42;cell = [tableView cellForRowAtIndexPath:indexPath];
  
  // Get item info
  NSArray &#42;array = [(ALTableView &#42;)tableView array].firstObject;
  NSDictionary &#42;item = array[indexPath.row];
  CGFloat timestamp = [item[@"timestamp"] doubleValue];
  
  // Check dates
  if (timestamp > self.today) {
    cell.dateLabel.text = @"Today";
  } else if (timestamp > self.yesterday) {
    cell.dateLabel.text = @"Yesterday";
  }
  return cell;
}

- (CGFloat)tableView:(UITableView &#42;)tableView heightForRowAtIndexPath:(NSIndexPath &#42;)indexPath {
  return [(ALTableView &#42;)tableView heightForRowAtIndexPath:indexPath];
}

//
// Lazy Instantiation
//
- (NSTimeInterval)today {
  if (!&#95;today) {
    NSCalendar &#42; calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    &#95;today = [calendar startOfDayForDate:[NSDate date]].timeIntervalSince1970;
  }
  return &#95;today;
}

- (NSTimeInterval)yesterday {
  if (!&#95;yesterday) {
    NSCalendar &#42; calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    &#95;yesterday = [[calendar startOfDayForDate:[NSDate date]] dateByAddingTimeInterval:-86400].timeIntervalSince1970;
  }
  return &#95;yesterday;
}

@end
</code></pre>
</div>

<img width="400" alt="Table view" src="/menu/complex/attachments/complex-customization-final-design.png">

* Run the app

## So is it really 100% customizable? Can I actually use Abstract Layer in production?

**Abstract Layer is as customizable as anything built from scratch.**

As you've seen in the example above, the framework is **fully** customizable since it's built on top of native `Apple UIKit` components like `UITableView` & `UICollectionView`.

To customize any aspect of Abstract Layer, simply:
* Subclass any of `Abstract Layer` classes to do your customizations
* Conform to the `delegate` and `datasource` protocols just as you would do with a regular `UITableView` & `UICollectionView`

<mark style="background-color: rgb(200, 235, 255);"><b>Abstract Layer is not a prototyping tool, it's strictly a production-level framework. All of our customers rely on Abstract Layer in their live apps.</b></mark>

### Where to go next?

Abstract Layer supports lots of features on `ALTableView`, so make sure to check them all out!

<table style="width:100%">
  <tr style="height:50px">
    <td class="row-text"><b><a href="/#/menu/table-view/error-handling" target="_blank">Error Handling</a></b><p>Handle all kind of errors when loading your table view</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/passing-data" target="_blank">Passing Data</a></b><p>You have FULL access to parsed data, so passing it is very simple</p><br/></td>
    <td class="row-text"><b><a href="/#/menu/table-view/parameters" target="_blank">Parameters</a></b><p>Be it Header or Body, Static or Dynamic, it's all in Interface Builder</p><br/></td> 
  </tr>

  <tr>
    <td class="row-text"><b><a href="/#/menu/table-view/pagination" target="_blank">Pagination</a></b><p>Enabling pagination takes less than a minute</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/parsing" target="_blank">Complex JSON</a></b><p>Any form of JSON is supported, no matter how complex it is</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/loader" target="_blank">Loader</a></b><p>Enable loaders and pull-to-refresh with 2 clicks</p><br/></td> 
  </tr>
  
    <tr>
    <td class="row-text"><b><a href="/#/menu/table-view/xib" target="_blank">XIB</a></b><p>Reuse cells by designing them in their own XIB</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/authentication" target="_blank">Authentication</a></b><p>JWT is handled automatically once you provide your keys</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/custom-cases" target="_blank">And More...</a></b><p>Check out the dedicated section for custom cases</p><br/></td> 
  </tr>
</table>

<span class="regular-note">Download the <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/demo/complex/Messenger.zip">final project</a> and try it out</span>