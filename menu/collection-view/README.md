# Collection View
> Learn how to populate a native `UICollectionView` from an API without the need to write code!

> Download the <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/demo/collection-view/Marketplace.zip">final project</a>

You're building the conversations screen in a chat app.

**Designer**: Here's a screenshot

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-final-done.png">

**Backend Engineer**: Here's the [API](http://docs.abstractlayer.com/demo/collection-view/marketplace/marketplace.json). 

<details>
  <summary>Click the arrow to check out the full JSON response</summary>

    <pre><code>
[
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/dress.jpg",
"name": "Black Dress",
"price": "35",
"id": "5925b5ac22f9a51d0ca5a3ce"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/mac.jpg",
"timestamp": 1491639798,
"name": "iMac 2017",
"price": "750",
"id": "5925b5ac58cff049f195e566"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/scarf.jpg",
"timestamp": 1491633121,
"name": "Colorful Scarf",
"price": "10",
"id": "5925b5ac71aef5f0f3febd4a"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/balance.jpg",
"timestamp": 1491634194,
"name": "New Balance",
"price": "350",
"id": "5925b5ac6af1272071a57d72"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/ps4.jpg",
"timestamp": 1491634511,
"name": "Playstation 4",
"price": "215",
"id": "5925b5acdfecdab484513b96"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/handbag.jpg",
"timestamp": 1491642125,
"name": "Red Hangbag",
"price": "425",
"id": "5925b5acec7ff952f35a65eb"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/bycicle.jpg",
"timestamp": 1491633389,
"name": "Used Bycicle",
"price": "300",
"id": "5925b5ac9b66bc12c486cdfb"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/phone.jpg",
"timestamp": 1491641044,
"name": "iPhone 7",
"price": "350",
"id": "5925b5acff14642da4571ef2"
},
{
"image_url": "http://docs.abstractlayer.com/demo/collection-view/marketplace/images/tv.jpg",
"timestamp": 1491630862,
"name": "Apple TV 4 Gen",
"price": "70",
"id": "5925b5ac42c8cdfb0c17664d"
}
]    </code></pre>
</details>

## The old way

Normally, you would do the following:

1. Build the UI in Interface Builder
2. Subclass your `UICollectionViewCell`
3. Link UI elements to the `UICollectionViewCell`
4. Create a `Product` model object with id, name, lastMessage, date, & imageUrl properties
5. Create a network manager
6. Build & send your `URLRequest` with URL & parameters
7. Receive a response and check for any errors
8. Parse the JSON response into models and check for parsing errors
9. Bind the parsed array with all the UI elements
10. Finally reload your `UICollectionView`!

## Abstract Layer way

Just set your `URL` & `JSON keys` right inside Interface Builder, and Abstract Layer will take care of everything else!

Let's see how this is done!

### Integrate the framework

If you haven't already added the framework to your Xcode project, follow [this tutorial](/menu/getting-started/).

### Building the UI

* Open `Main.storyaboard` and delete the default View Controller you see

* Drag an instance of `UICollectionViewController`
From the menu bar choose "Editor" → "Embed in" → "Navigation Controller"

* Select your Navigation Controller and mark it as `Is initial View Controller` from the attributes inspector

<img width="800" alt="Collection view" src="/menu/Collection-view/attachments/collection-view-main-initial.png">

* Click on your prototype cell, and set the `cell identifier` to `cell` in the attributes inspector

* Change the height of the cell to 80 instead of 44 by dragging the prototype cell from the bottom in your storyboard

* Design the Collectionview's cell to match the design

	* `UIImageView` for `Product Image` (size 50x50)
	* `UILabel` for `Price`  (Font size 17, semibold, white)

<img width="800" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-design.png">

This is just the way you build any UI, the next part is where the magic happens!

> **NOTE:** The API doesn't uses https, so you must exculde this domain by adding `App Transport Layer` key to your `info.plist`

<img width="500" alt="Table view" src="/menu/collection-view/attachments/app-transport-layer.png">

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

### Magic (Auto data-binding)

Follow these steps to bind data between the JSON document that you have and the respective UI elements.

* Open up your [API](http://docs.abstractlayer.com/demo/table-view/silicon-valley/conversations.json) in a browser and take a look at the format & keys. It's an array of conversations, each with the following keys:
	* id
	* price
	* image_url
	* name

Setup your collection view attributes by doing the following:

* Copy the URL from the browser and head back to your storyboard

* Click on your `UICollectionView` and change its class to 
`ALCollectionView` in the attributes inspector

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-class.png">

* Navigate to your attributes inspector, and you'll find a couple new attributes
Set the number of columns to `2`

* Paste the URL you just copied in the new `Url` field
Type in `GET` for `HTTP Method`

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-url.png">

Your collection view is now ready to process the API. It's time to match the `JSON keys` with the `UI elements` to fill the data automatically.

* Start by modifying your `UIImageView` to display the user profile pic by doing the following:

	* Click on your `UIImageView` and change its class to `CPImageView` in the identity inspector

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-cpimage.png">

* Type in `image_url` in the `Json Key` field so that Abstract Layer can automatically load the image using its URL value

One more thing, give your image view a Corner Radius of 5 to give a more elegant look!

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-image-url.png">

* Click on the price label and change its class to `ALLabel` in the identity inspector

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price-label.png">

Type in `price` in the `Json Key` field to automatically match the JSON value with the price label. Add `$` as a prefix

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price.png">

Run the project, and there you go! MAGIC!

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-final-done.png">

You got your collection view fully designed and populated without writing a single line of code!

### Where to go next?

> Download the <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/demo/collection-view/Marketplace.zip">final project</a> and try it out

Abstract Layer supports lots of features on the `ALCollectionView`, so make sure to check them all out!

* [Parameters](/menu/collection-view/parameters)
* [Pagination](/menu/collection-view/pagination)
* [Parsing](/menu/collection-view/parsing)
* [Loader & pull to refresh](/menu/collection-view/loader)
* [XIB](/menu/collection-view/xib)
* [Authentication](/menu/collection-view/authentication)

As for customizability, Abstract Layer has a [dedicated section](/menu/collection-view/custom-cases) for it.