# Table View
> Learn how to populate a native `UITableView` from an API without the need to write code!

You're building the conversations screen in a chat app.

👨‍🎨 **Designer be like**: Here's a screenshot

<img width="200" alt="Table view" src="/table-view/attachments/table-view-main-designer-screenshot.png">
	 </td> 
    <td>

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

If you haven't already, follow [this tutorial](/getting-started/quick-start) to integrate the framework into your project.

