# Table View
> Learn how to populate a native `UITableView` from an API without a single line of code! 

You're building the conversations screen in a chat app. Here are the API and the design.

**API URL**: [http://docs.abstractlayer.com/demo/table-view/silicon-valley/conversations.json](http://docs.abstractlayer.com/demo/table-view/silicon-valley/conversations.json). 

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

## Abstract Layer way

Just set your API information right inside Interface Builder, and Abstract Layer will populate the table view for you!

Let's see how this is done!

### Integrate the framework

If you haven't already added the framework to your Xcode project, follow [this tutorial](/menu/getting-started/).

### Building the UI

* Open `Main.storyboard` and delete the default view controller

* Drag an instance of `UITableViewController`
From the menu bar choose:

`Editor → Embed in → Navigation Controller`

* Click on your navigation controller then check the box that says `Is initial View Controller` from the attributes inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-initial.png">

* Click on your prototype cell, and set the `cell identifier` to `cell` in the attributes inspector

* Drag the prototype cell in your storyboard from the bottom to increase its `height to 80`

* Design the tableview's cell to match the design
	
	<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-design.png">
	
	* `UIImageView` for the user image **(size 50x50)**
	* `UILabel` for the name label  **(Font size 13, semibold, black)**
	* `UILabel` for the last message label **(Font size 12, regular, dark gray)**
	* `UILabel` for the date label **(Font size 12, regular, light gray)**
	


* Choose `2 lines` for last message label

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-2-line.png">
	
#### Security

The API doesn't uses https, so you must exclude this domain by adding `App Transport Layer` key to your `info.plist`

<img width="500" alt="Table view" src="/menu/table-view/attachments/app-transport-layer.png">

Raw value:
```xml
<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>abstractlayer.com</key>
			<dict>
				<key>NSExceptionAllowsInsecureHTTPLoads</key>
				<true/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
		</dict>
	</dict>
```
#### Circular Image

To get a circular user image:

* Click on your user image view and head to the attribute inspector.

* Choose `ON` for `circular`. 

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-circular-image.png">

### Magic (Auto data-binding)

It's time to bind data between the JSON document and the UI elements.

* Open the URL in a browser [http://docs.abstractlayer.com/demo/table-view/silicon-valley/conversations.json](http://docs.abstractlayer.com/demo/table-view/silicon-valley/conversations.json) 

* Copy the URL

* Go to your storyboard and click on your `UITableView` and change its class to `ALTableView` in the identity inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cptable.png">

* Navigate to your attributes inspector, and you'll find a list of new attributes

* Paste the URL you just copied in the new `Url` field

* Type in `GET` for HTTP method

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-url.png">

Your table view is now ready to process the API. It's time to match the **JSON keys** with the **UI elements** to fill the data automatically.

* Click on your `UIImageView` and change its class to `ALImageView` in the identity inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpimage.png">

* Type in `image_url` in the `Json Key` field so that Abstract Layer can automatically load the image using its URL value

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-image-url.png">

* Click on the name label and change its class to `ALLabel` in the identity inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cplabel.png">

* Type in `name` in the `Json Key` field to automatically match the JSON value with the name label

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-name.png">

* Click on the last message label and change its class to `ALLabel` in the attributes inspector

* Type in `last_message` in the `Json Key` field

* Click on the date label and change its class to `ALDateLabel` in the attributes inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpdate.png">

* Type in `timestamp` in the `Json Key` field

* Type in `MM/dd/yyyy` in the `Output Format` field to get the desired date format displayed. 

> The format should abide by [Apple's DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter) rules

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-date-format.png">

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-designer-screenshot.png">
 
Run the project, and there you go! MAGIC!

## Hold on

This looks great so far, but we're sure you've got many questions about how far can Abstract Layer go. 

The answer is: **VERY!**

Check out this example to see for yourself.

### Display "Today" & "Yesterday" instead of full date

Instead of just displaying the dates in `MM/dd/yyyy` format, let's add 2 conditions. Display `today` or `yesterday` if the dates are within these two ranges.

> Remember: `ALTableView` is a subclass of `UITableView`

> Remember: You have FULL access to the data parsed by accessing the `array` property on your Table view

How to do it:

1- Subclass `UITableViewCell` and link the date label

2- Subclass `UITableViewController` and do the conversion in `cellForItemAtIndexPath`

Step by step:

* Create a new class, call it `CustomTableViewCell`

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-custom-cell-class.png">

* Set the Table view cell class to `CustomTableViewCell`

<img width="300" alt="Table view" src="/menu/collection-view/attachments/collection-view-main-custom-cell.png">

* Control-drag your date label to the class as a new outlet and call it `dateLabel`

* Don't forget to import `AbstractLayer` to the class's header

<img width="600" alt="Collection view" src="/menu/table-view/attachments/table-view-main-link-date.png">

* Create a new class, call it `TableViewController` and subclass it form `UITableViewController`

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-subclass-uitableviewcontroller.png">

* Set your collection view class in storyboard to `TableViewController`

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-custom-tableviewcontroller-class.png">

* Replace the content of the class with the following:

<div style="height:30px;">
<button id="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button id="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div id="swiftDIV" style="background-color:rgb(248,248,248);">
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


<div style="display:none; background-color:rgb(248,248,248);" id="objcDIV">
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

> Download the <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/demo/table-view/Conversations.zip">final project</a> and try it out

Abstract Layer supports lots of features on the `ALTableView`, so make sure to check them all out!

* [Parameters](/menu/table-view/parameters)
* [Pagination](/menu/table-view/pagination)
* [Parsing](/menu/table-view/parsing)
* [Loader & pull to refresh](/menu/table-view/loader)
* [XIB](/menu/table-view/xib)
* [Authentication](/menu/table-view/authentication)

As for customizability, Abstract Layer has a [dedicated section](/menu/table-view/custom-cases) for it.