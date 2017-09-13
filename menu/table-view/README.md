<div>
<span class="right-note">9 minutes tutorial</span>
 <h1>Table View</h1>
</div>

<span style="background-color:rgb(248,248,248);padding:15px;font-weight:800;font-size:16;">Build an API-backed table in minutes, right from Interface Builder!</span>

**Example:** Chatting app

**API URL**: [https://api.abstractlayer.com/demo/silicon_valley/get_users](https://api.abstractlayer.com/demo/silicon_valley/get_users) 

<details>
  <summary>Click the arrow to check out the full JSON response</summary>

    <pre><code>[
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/richard-hendricks.jpg",
    "timestamp": 1491631526,
    "last_message": "Thank god they use tabs!",
    "name": "Richard Hendricks",
    "id": "5925b5ac22f9a51d0ca5a3ce"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/guilfoyle.jpg",
    "timestamp": 1491639798,
    "last_message": "This framework is better than hell.",
    "name": "Guilfoyle",
    "id": "5925b5ac58cff049f195e566"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/dinesh.jpg",
    "timestamp": 1491633121,
    "last_message": "I can’t believe Guilfoyle actually loved something other than himself.",
    "name": "Dinesh",
    "id": "5925b5ac71aef5f0f3febd4a"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/jared.jpg",
    "timestamp": 1491634194,
    "last_message": "Based on my SWOT analysis, this framework is a great investment.",
    "name": "Jared",
    "id": "5925b5ac6af1272071a57d72"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/jian-yang.jpg",
    "timestamp": 1491634511,
    "last_message": "This is not a hotdog.",
    "name": "Jian Yang",
    "id": "5925b5acdfecdab484513b96"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/erlic-bachman.jpg",
    "timestamp": 1491642125,
    "last_message": "Abstract Layer is the intersection of spirituality and automation.",
    "name": "Erlic Bachman",
    "id": "5925b5acec7ff952f35a65eb"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/laurie-bream.jpg",
    "timestamp": 1491633389,
    "last_message": "Is Abstract Layer raising?",
    "name": "Laurie Bream",
    "id": "5925b5ac9b66bc12c486cdfb"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/gavin-belson.jpg",
    "timestamp": 1491641044,
    "last_message": "Why again did Hooli not build this framework?",
    "name": "Gavin Belson",
    "id": "5925b5acff14642da4571ef2"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/russ-hanneman.jpg",
    "timestamp": 1491630862,
    "last_message": "This framework f*cks!",
    "name": "Russ Hanneman",
    "id": "5925b5ac42c8cdfb0c17664d"
  },
  {
    "image_url": "http://docs.abstractlayer.com/demo/table-view/silicon-valley/images/big-head.jpg",
    "timestamp": 1491639079,
    "last_message": "Woah this Abstract Layer thing is awesome!!",
    "name": "Big Head",
    "id": "5925b5ac29f5b9e382590e1a"
  }
]    </code></pre>
</details>

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-designer-screenshot.png">

### Integrate the framework

If you haven't already added the framework to your Xcode project, follow [this tutorial](/).

### Build the UI

* Open `Main.storyboard` and delete the default view controller

* Drag an instance of `UITableViewController`
From the menu bar choose:

`Editor → Embed in → Navigation Controller`

* Click on your navigation controller then check the box that says `Is initial View Controller` from the **Attributes Inspector**

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-initial.png">

* Click on your prototype cell, and set the `cell identifier` to `cell` in the **Attributes Inspector**

* Drag the prototype cell in your storyboard from the bottom to increase its `height to 80`

* Design the tableview's cell to match the design
	
	<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-design.png">
	
	* `UIImageView` for the user image **(size 50x50)**
	* `UILabel` for the name label  **(Font size 13, semibold, black)**
	* `UILabel` for the last message label **(Font size 12, regular, dark gray)**
	* `UILabel` for the date label **(Font size 12, regular, light gray)**
	


* Choose `2 lines` for last message label

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-2-line.png">

### Magic (Auto data-binding)

It's time to bind data between the JSON document and the UI elements.

* Open the URL in a browser [https://api.abstractlayer.com/demo/silicon_valley/get_users](https://api.abstractlayer.com/demo/silicon_valley/get_users) 

* Copy the URL

* Go to your storyboard and click on your `UITableView` and change its class to `ALTableView` in the **Identity Inspector**

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-cptable.png">

* Navigate to your **Attributes Inspector**, and you'll find a list of new attributes

* Paste the URL you just copied in the new `Url` field

* Type in `GET` for HTTP method

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-url.png">

Your table view is now ready to process the API. It's time to match the **JSON keys** with the **UI elements** to fill the data automatically.

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

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-designer-screenshot.png">
 
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

* Replace the content of the class with the following:

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
    let cell = table.cellForRow(at: indexPath) as! CustomTableViewCell
    
    // Get item info
    let array = table.array.first as! [[String:Any]]
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
  
  override func tableView(&#95; tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableView.numberOfRows(inSection: section)
  }
  
  override func tableView(&#95; tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let table = tableView as! ALTableView
    return table.heightForRow(at: indexPath)
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

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-date-change.png">

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
    <td class="row-text"><b><a href="/#/menu/table-view/authentication" target="_blank">Authentication</a></b><p>JWT is handled automtically once you provide your keys</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/table-view/custom-cases" target="_blank">And More...</a></b><p>Check out the dedicated section for custom cases</p><br/></td> 
  </tr>
</table>

<span class="regular-note">Download the <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/demo/table-view/Conversations.zip">final project</a> and try it out</span>