# Table View
> Learn how to populate a native `UITableView` from an API without the need to write code!

You're building the conversations screen in a chat app.

👨‍🎨 **Designer be like**: Here's a screenshot

<img width="200" alt="Table view" src="/menu/table-view/attachments/table-view-main-designer-screenshot.png">

👩‍💻 **Backend Engineer be like**: Here's the [API](https://firebasestorage.googleapis.com/v0/b/betterco-79f87.appspot.com/o/sample.json?alt=media&token=8c7f425e-cdc4-44da-8d34-0c0a15a3f87e). 

<details>
  <summary>Click the arrow to check out the full JSON response</summary>

    <pre><code>[
  {
    "image_url": "https://randomuser.me/api/portraits/women/94.jpg",
    "timestamp": 1491631526,
    "last_message": "Lorem ut irure est reprehenderit non non nulla duis mollit.",
    "name": "Kirby Gallagher",
    "id": "5925b5ac22f9a51d0ca5a3ce"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/women/17.jpg",
    "timestamp": 1491639798,
    "last_message": "Voluptate sint non aute proident nulla sint pariatur et nostrud ipsum duis.",
    "name": "Marilyn Whitfield",
    "id": "5925b5ac58cff049f195e566"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/women/49.jpg",
    "timestamp": 1491633121,
    "last_message": "Incididunt laborum sit nostrud consectetur officia anim sint.",
    "name": "Dunlap Sandoval",
    "id": "5925b5ac71aef5f0f3febd4a"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/women/7.jpg",
    "timestamp": 1491634194,
    "last_message": "Non duis ex amet dolor laboris duis ad veniam ex minim cillum enim non.",
    "name": "Rosales Mcguire",
    "id": "5925b5ac6af1272071a57d72"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/men/54.jpg",
    "timestamp": 1491634511,
    "last_message": "Reprehenderit ad id reprehenderit eiusmod ullamco do ex velit laborum id est sunt occaecat.",
    "name": "Head Dunlap",
    "id": "5925b5acdfecdab484513b96"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/men/41.jpg",
    "timestamp": 1491642125,
    "last_message": "Magna exercitation consequat qui proident incididunt aliqua aute dolore ullamco.",
    "name": "Verna Boyle",
    "id": "5925b5acec7ff952f35a65eb"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/men/34.jpg",
    "timestamp": 1491633389,
    "last_message": "Ullamco quis ex reprehenderit qui nulla labore veniam ad tempor laboris aliqua adipisicing reprehenderit.",
    "name": "Jan Avery",
    "id": "5925b5ac9b66bc12c486cdfb"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/men/69.jpg",
    "timestamp": 1491641044,
    "last_message": "Adipisicing ullamco consectetur magna sit commodo.",
    "name": "Lela Harding",
    "id": "5925b5acff14642da4571ef2"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/men/18.jpg",
    "timestamp": 1491630862,
    "last_message": "Consequat nulla ipsum ullamco excepteur fugiat.",
    "name": "Bernadine Briggs",
    "id": "5925b5ac42c8cdfb0c17664d"
  },
  {
    "image_url": "https://randomuser.me/api/portraits/women/94.jpg",
    "timestamp": 1491639079,
    "last_message": "Elit laborum ullamco exercitation cupidatat amet excepteur.",
    "name": "Golden May",
    "id": "5925b5ac29f5b9e382590e1a"
  }
]
    </code></pre>
</details>

## The old way 🐌

Normally, you would do the following:

1. Build the UI in Interface Builder
2. Subclass your `UITableViewCell`
3. Link UI elements to the `UITableViewCell`
4. Create a `Conversation` model object with id, name, lastMessage, date, & imageUrl properties
5. Create a network manager
6. Build & send your `NSURLRequest` with [URL](https://firebasestorage.googleapis.com/v0/b/betterco-79f87.appspot.com/o/sample.json?alt=media&token=8c7f425e-cdc4-44da-8d34-0c0a15a3f87e) & parameters
7. Receive a response and check for any errors
8. Parse the JSON response into models
9. Bind the parsed array with UI
10. Finally reload your `UITableView`!

## Abstract Layer way 🚀

Just set your `URL` & `JSON keys` right inside Interface Builder, and Abstract Layer will take care of everything else!

### Integrate the framework

If you haven't already, follow [this tutorial](/menu/getting-started/) to integrate the framework into your project.

### Building the UI

Open `Main.storyaboard` and delete the default View Controller you see

Drag an instance of `UITableViewController`
From the menu bar choose "Editor" → "Embed in" → "Navigation Controller"

Select your Navigation Controller and mark it as `Is initial View Controller` from the attributes inspector

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-initial.png">

Click on your prototype cell, and set the `cell identifier` to `cell` in the attributes inspector

Change the height of the cell to 80 instead of 44

Design the tableview's cell to match the design

* UIImageView size 50,50
* Name UILabel (Font size 13, semibold, black)
* Last Message UILabel (Font size 12, regular, dark gray)
* Date UILabel (Font size 12, regular, light gray)

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-design.png">

This is just the way you build any UI, the next part is where the magic happens!

### Magic (Auto data-binding)

Follow these steps to bind data between the JSON document that you have and the respective UI elements.

Open up your JSON document in a browser and take a look at the format & keys, it's very straightforward

Setup your table view attributes by doing the following:

Copy the URL from the browser and head back to your storyboard
Click on your `UITableViewController` and change its class to `CPTableViewController` in the attributes inspector

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-cptable.png">

Navigate to your attributes inspector, and you'll find a couple new attributes

Paste the URL you just copied in the new `Url` field
Type in `GET` for HTTP method

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-url.png">

Your table view is now ready to process the API. It's time to match the JSON keys with the UI elements to fill the data automatically.

Start by modifying your `UIImageView` to display the user profile pic by doing the following:
Click on your `UIImageView` and change its class to `CPImageView` in the identity inspector

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpimage.png">

Type in `image_url` in the `Json Key` field so that Codepack can automatically load the image using its URL value

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-image-url.png">

The name and last message labels are treated the same way:

Click on the name label and change its class to `CPLabel` in the identity inspector

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-cplabel.png">

Type in `name` in the `Json Key` field to automatically match the JSON value with the name label

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-name.png">

Click on the last message label and change its class to `CPLabel` in the attributes inspector

Type in `last_message` in the `Json Key` field

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-last-message.png">

As for the date label field, it's a different class:
Click on the date label and change its class to `CPDateLabel` in the attributes inspector

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-cpdate.png">

Type in `timestamp` in the `Json Key` field to automatically parse the JSON key value into this label
Type in `HH:mm a` in the `Date Format` field to get the desired date format displayed. The format should abide by `UIDateFormatter`'s rules

<img width="600" alt="Table view" src="/menu/table-view/attachments/table-view-main-date-format.png">

Run the project, and there you go! MAGIC!

<img width="200" alt="Table view" src="/menu/table-view/attachments/table-view-main-square.png">

Whoops! The image view isn't circular, do we need to write code for that? 
NO, just click on your image view in storyboard and switch `circular` attribute option to `ON`

Run again... and there you go!

<img width="200" alt="Table view" src="/menu/table-view/attachments/table-view-main-final.png">

You got your table view fully designed and populated without writing a single line of code!

### How complex can Codepack go? 
Codepack is ideal for small and medium complexity apps where you can create full apps without having to write a line of code. And just like you saw above, it can be fully customizable.

If things get more complex, this probably means that your app has a certain functionality or business logic that is very specific and unique. In this case, feel free to add your own code and logic on top. In the end Codepack is just a framework that you add to your native Xcode project.

Check the [customization](/menu/table-view/custom-cases) section for more examples.