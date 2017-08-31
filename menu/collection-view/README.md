# Collection View
> Populate a collection view without writing a single line of code! Just set the `URL` & `JSON keys`. 

**Example**: Marketplace app

**API URL**: [http://docs.abstractlayer.com/demo/collection-view/marketplace/marketplace.json](http://docs.abstractlayer.com/demo/collection-view/marketplace/marketplace.json). 

<details>
  <summary>Click here to check out the full JSON response</summary>

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

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-final-done.png">

### Integrate the framework

If you haven't already added the framework to your Xcode project, follow [this tutorial](/menu/getting-started/).

### Build the UI

* Open `Main.storyaboard` and delete the default View Controller you see

* Drag an instance of `UICollectionViewController`
From the menu bar choose `Editor" → "Embed in" → "Navigation Controller`

* Click on your navigation controller then check the box that says `Is initial View Controller` from the attributes inspector

<img width="800" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-initial1.png">

* Click on your prototype cell, and set the `cell identifier` to `cell` in the attributes inspector

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-cell-id.png">

* Design the collection view's cell to match the design

	* `UIImageView` for the product image (size 150x150)
	* `UILabel` for the price label  (Font size 17, semibold, white)

<img width="800" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-design.png">

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

It's time to bind data between the JSON document and the UI elements.

* Open the URL in a browser [http://docs.abstractlayer.com/demo/collection-view/marketplace/marketplace.json](http://docs.abstractlayer.com/demo/collection-view/marketplace/marketplace.json)

* Copy the URL

* Go to your storyboard and click on your `UICollectionView` and change its class to 
`ALCollectionView` in the attributes inspector

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-class.png">

* Navigate to your attributes inspector, and you'll find a couple new attributes

* Set the number of columns to `2`

* Paste the URL you just copied in the new `Url` field

* Type in `GET` for `HTTP Method` (which is the default method)

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-url.png">

Your collection view is now ready to process the API. 

It's time to match the `JSON keys` with the `UI elements` to fill the data automatically.

* Click on your `UIImageView` and change its class to `ALImageView` in the identity inspector

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-cpimage.png">

* Type in `image_url` in the `Json Key` field so that Abstract Layer can automatically load the image using its URL value

* One more thing, give your image view a `Corner Radius` of 5 to give a more elegant look!

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-image-url.png">

* Click on the price label and change its class to `ALLabel` in the identity inspector

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price-label.png">

Type in `price` in the `Json Key` field to automatically match the JSON value with the price label. Add `$` as a prefix

<img width="500" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price.png">

Run the project, and there you go! MAGIC!

## Hold on

This looks great so far, but we're sure you've got many questions about how far can Absract Layer go. 

The answer is: **VERY!**

Check out this example to see for yourself.

### Convert label price from USD to EUR

> Remember: `ALColletionView` is a subclass of `UICollectionView`

> Remember: You have FULL access to the data parsed by accessing the `array` property on your collection view

How to do it:

1- Subclass `UICollectionViewCell` and link the price label

2- Subclass `UICollectionViewController` and do the conversion in `cellForItemAtIndexPath`

Step by step:

* Create a new class, call it `CustomCollectionViewCell`

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-cell-class.png">

* Set the collection view cell class to `CustomCollectionViewCell`

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-cell.png">

* Control-drag your price label to the class as a new outlet and call it `priceLabel`

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-cell-label.png">

* Create a new class, call it `CollectionViewController` and subclass it form `UICollectionViewController`

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-collection-class.png">

* Replace the content of the class with the following:

```Swift
import UIKit
import AbstractLayer

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collection = collectionView as! ALCollectionView
    let cell = collection.cellForItem(at: indexPath) as! CustomCollectionViewCell // Get cell
    
    let item = collection.array[indexPath.row] as! [String:Any] // Get item dictionary
    var price = Float(item["price"] as! String) // Price in USD
    price = price! * 0.85 // Convert to EUR
    cell.priceLabel?.text = "€" + String(describing: price!) // Set new value
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionView.numberOfItems(inSection: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collection = collectionView as! ALCollectionView
    return collection.sizeForItem(at: indexPath)
  }
}
```

```Objective-C
#import "CollectionViewController.h"
#import <AbstractLayer/AbstractLayer.h>

@implementation CollectionViewController

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
  ALCollectionView *collection = (ALCollectionView *)collectionView;
  CustomTableViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  
  NSDictionary *item = (NSDictionary *)collection.array[indexPath.row];
  CGFloat price = [item[@"price"] floatValue];
    price = price * 0.85 // Convert to EUR
    cell.priceLabel.text = [NSString stringWithFormat:@"€%.2f",price]; // Set new value  
  return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return [collectionView numberOfItemsInSection:section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
  return [(ALCollectionView *)collectionView sizeForItemAtIndexPath:indexPath];
}

@end
```

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