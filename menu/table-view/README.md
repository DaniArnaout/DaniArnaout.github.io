# Table View
> Learn how to populate a native `UITableView` from an API without a single line of code!

You're building the conversations screen in a chat app.

**Designer**: Here's a screenshot

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-designer-screenshot.png">

**Backend Engineer**: Here's the [API](http://docs.abstractlayer.com/demo/table-view/silicon-valley/conversations.json). 

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

## The old way

Normally, you would do the following:

1. Build the UI in Interface Builder
2. Subclass your `UITableViewCell`
3. Link UI elements to the `UITableViewCell`
4. Create a `Conversation` model object with id, name, lastMessage, date, & imageUrl properties
5. Create a network manager
6. Build & send your `URLRequest` with URL & parameters
7. Receive a response and check for any errors
8. Parse the JSON response into models and check for parsing errors
9. Bind the parsed array with all the UI elements
10. Finally reload your `UITableView`!

## Abstract Layer way

Just set your `URL` & `JSON keys` right inside Interface Builder, and Abstract Layer will take care of everything else!

Let's see how this is done!

### Integrate the framework

If you haven't already added the framework to your Xcode project, follow [this tutorial](/menu/getting-started/).

### Building the UI

* Open `Main.storyaboard` and delete the default View Controller you see

* Drag an instance of `UITableViewController`
From the menu bar choose "Editor" → "Embed in" → "Navigation Controller"

* Select your Navigation Controller and mark it as `Is initial View Controller` from the attributes inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-initial.png">

* Click on your prototype cell, and set the `cell identifier` to `cell` in the attributes inspector

* Change the height of the cell to 80 instead of 44 by dragging the prototype cell from the bottom in your storyboard

* Design the tableview's cell to match the design

	* `UIImageView` for `User Image` (size 50x50)
	* `UILabel` for `Name`  (Font size 13, semibold, black)
	* `UILabel` for `Last Message` (Font size 12, regular, dark gray)
	* `UILabel` for `Date` (Font size 12, regular, light gray)

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-design.png">

This is just the way you build any UI, the next part is where the magic happens!

### Magic (Auto data-binding)

Follow these steps to bind data between the JSON document that you have and the respective UI elements.

* Open up your [API](http://docs.abstractlayer.com/demo/table-view/silicon-valley/conversations.json) in a browser and take a look at the format & keys. It's an array of conversations, each with the following keys:
	* id
	* name
	* image_url
	* last_message
	* date

Setup your table view attributes by doing the following:

* Copy the URL from the browser and head back to your storyboard

* Click on your `UITableView` and change its class to `ALTableView` in the identity inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cptable.png">

* Navigate to your attributes inspector, and you'll find a couple new attributes

* Paste the URL you just copied in the new `Url` field
Type in `GET` for HTTP method

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-url.png">

Your table view is now ready to process the API. It's time to match the `JSON keys` with the `UI elements` to fill the data automatically.

* Start by modifying your `UIImageView` to display the user profile pic by doing the following:
	* Click on your `UIImageView` and change its class to `ALImageView` in the identity inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpimage.png">

* Type in `image_url` in the `Json Key` field so that Abstract Layer can automatically load the image using its URL value

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-image-url.png">

* The name and last message labels are treated the same way:

* Click on the name label and change its class to `ALLabel` in the identity inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cplabel.png">

* Type in `name` in the `Json Key` field to automatically match the JSON value with the name label

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-name.png">

* Click on the last message label and change its class to `ALLabel` in the attributes inspector

	* Type in `last_message` in the `Json Key` field

* As for the date label field, it's a different class:

	* Click on the date label and change its class to `ALDateLabel` in the attributes inspector

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpdate.png">

* Type in `timestamp` in the `Json Key` field

* Type in `MM/dd/yyyy` in the `Output Format` field to get the desired date format displayed. 
<br>
*The format should abide by [DateFormatter's](https://developer.apple.com/documentation/foundation/dateformatter) rules*

<img width="800" alt="Table view" src="/menu/table-view/attachments/table-view-main-date-format.png">

* Run the project, and there you go! MAGIC!

<img width="300" alt="Table view" src="/menu/table-view/attachments/table-view-main-designer-screenshot.png">

You got your table view fully designed and populated without writing a single line of code!

### Where to go next?

Abstract Layer supports lots of features on the `ALTableView`, so make sure to check them all out!

* [Parameters](/menu/table-view/parameters)
* [Pagination](/menu/table-view/pagination)
* [Parsing](/menu/table-view/parsing)
* [Loader & pull to refresh](/menu/table-view/loader)
* [XIB](/menu/table-view/xib)
* [Authentication](/menu/table-view/authentication)

As for customizability, we dedicated a [whole section](/menu/table-view/custom-cases) for it.