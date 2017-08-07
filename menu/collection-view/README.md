# Collection View
> Learn how to populate a native `UICollectionView` from an API without the need to write code!

You're building the conversations screen in a chat app.

👨‍🎨 **Designer be like**: Here's a screenshot

<img width="200" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-final.png">

👩‍💻 **Backend Engineer be like**: Here's the [API](https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2Fsaily-items.json?alt=media&token=63c68591-12fc-4ed1-9e81-e410105f665e). 

<details>
  <summary>Click the arrow to check out the full JSON response</summary>

    <pre><code>
[
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F1.jpg?alt=media&token=55ec1562-7454-4948-8f17-b6aa7479ce42",
	"name": "Black Dress",
	"price": "35",
	"id": "5925b5ac22f9a51d0ca5a3ce"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F2.jpg?alt=media&token=dd02becb-cd1c-417e-bd69-29be24f20bfa",
	"timestamp": 1491639798,
	"name": "iMac 2017",
	"price": "750",
	"id": "5925b5ac58cff049f195e566"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F3.jpg?alt=media&token=02da0bcf-6d99-4d85-9472-2a0828ae2030",
	"timestamp": 1491633121,
	"name": "Colorful Scarf",
	"price": "10",
	"id": "5925b5ac71aef5f0f3febd4a"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F4.jpg?alt=media&token=cac819d2-55e5-4cd3-ab1a-9ca722e6e884",
	"timestamp": 1491634194,
	"name": "New Balance",
	"price": "350",
	"id": "5925b5ac6af1272071a57d72"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F5.jpg?alt=media&token=dc5d08ff-423b-48cb-b1e0-552c172b2aac",
	"timestamp": 1491634511,
	"name": "Playstation 4",
	"price": "215",
	"id": "5925b5acdfecdab484513b96"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F6.jpg?alt=media&token=1820f498-834f-4685-9a38-cd9ef8db712e",
	"timestamp": 1491642125,
	"name": "Red Hangbag",
	"price": "425",
	"id": "5925b5acec7ff952f35a65eb"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F7.jpg?alt=media&token=c145c935-dbda-4139-9454-f452c48dbca9",
	"timestamp": 1491633389,
	"name": "Used Bycicle",
	"price": "300",
	"id": "5925b5ac9b66bc12c486cdfb"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F8.jpg?alt=media&token=f94cbedd-c38c-4219-b95d-ffee8ddacedb",
	"timestamp": 1491641044,
	"name": "iPhone 7",
	"price": "350",
	"id": "5925b5acff14642da4571ef2"
	},
	{
	"image_url": "https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2F9.jpg?alt=media&token=996da813-1ac1-44cc-a8bc-2cea48be100e",
	"timestamp": 1491630862,
	"name": "Apple TV 4 Gen",
	"price": "70",
	"id": "5925b5ac42c8cdfb0c17664d"
	}
]    </code></pre>
</details>

## The old way 🐌

Normally, you would do the following:

1. Build the UI in Interface Builder
2. Subclass your `UICollectionViewCell`
3. Link UI elements to the `UICollectionViewCell`
4. Create a `Product` model object with id, name, price, & imageUrl properties
5. Create a network manager
6. Build & send your `NSURLRequest` with [URL](https://firebasestorage.googleapis.com/v0/b/abstract-layer.appspot.com/o/Demo%2FCollectionView%2FSaily%2Fsaily-items.json?alt=media&token=63c68591-12fc-4ed1-9e81-e410105f665e) & parameters
7. Receive a response and check for any errors
8. Parse the JSON response into models
9. Bind the parsed array with UI
10. Finally reload your `UICollectionView`!

## Abstract Layer way 🚀

Just set your `URL` & `JSON keys` right inside Interface Builder, and Abstract Layer will take care of everything else!

### Integrate the framework

If you haven't already, follow [this tutorial](/menu/getting-started/) to integrate the framework into your project.

### Building the UI
Open `Main.storyaboard` and delete the default View Controller you see

Drag an instance of `UICollectionViewController`

From the menu bar choose "Editor" → "Embed in" → "Navigation Controller"

Select your Navigation Controller and mark it as `Is initial View Controller` from the attributes inspector

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-initial.png">

Click on your prototype cell, and set the `cell identifier` to `cell in the attributes inspector

Change the cell size to 100x100

Set min spacing for cell & lines to 10

Set all section insets to 10 as well

Design the collection view's cell to match the design 

* UIImageView size 100,100
* Price UILabel (Font size 14, dark grey)

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-cell.png">

This is just the way you build any UI, the next part is where the magic happens!

### Magic (Auto data-binding)

Follow these steps to bind data between the JSON document that you have and the respective UI elements.

Open up your JSON document in a browser and take a look at the format & keys, it's very straightforward

Setup your collection view attributes by doing the following:

Copy the URL from the browser and head back to your storyboard

Click on your UICollectionViewController and change its class to 
`CPCollectionViewController` in the attributes inspector

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-class.png">

Navigate to your attributes inspector, and you'll find a couple new attributes
Set the number of columns to `2`

Paste the URL you just copied in the new `Url` field
Type in `GET` for `HTTP Method`

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-url.png">

Your collection view is now ready to process the API. It's time to match the JSON keys with the UI elements to fill the data automatically.

Start by modifying your `UIImageView` to display the user profile pic by doing the following:

Click on your `UIImageView` and change its class to `CPImageView` in the identity inspector

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-cpimage.png">

Type in `image_url` in the `Json Key` field so that Abstract Layer can automatically load the image using its URL value

One more thing, give your image view a Corner Radius of 5 to give a more elegant look!

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-image-url.png">

The name and last message labels are treated the same way:
Click on the name label and change its class to `CPLabel` in the identity inspector

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price-label.png">

Type in `price` in the `Json Key` field to automatically match the JSON value with the price label. Add `$` as a prefix

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price.png">

Run the project, and there you go! MAGIC!

<img width="200" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-final-done.png">

You got your collection view fully designed and populated without writing a single line of code!

### How complex can Abstract Layer go? 

Abstract Layer is ideal for small and medium complexity apps where you can create full apps without having to write a line of code. And just like you saw above, it can be fully customizable.

If things get more complex, this probably means that your app has a certain functionality or business logic that is very specific and unique. In this case, feel free to add your own code and logic on top. In the end Abstract Layer is just a framework that you add to your native Xcode project.

Check the [customization](/menu/collection-view/custom-cases) section for more examples.