<div>
<span class="right-note">9 minutes tutorial</span>
 <h1>Collection View</h1>
</div>

<span style="background-color:rgb(248,248,248);padding:15px;font-weight:800;font-size:16;">Build an API-backed collection view in minutes, right from Interface Builder!</span>

**Example**: Marketplace app

**API URL**: [https://api.abstractlayer.com/demo/marketplace/get_items](https://api.abstractlayer.com/demo/marketplace/get_items). 

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

* Open `Main.storyboard` and delete the default View Controller you see

* Drag an instance of `UICollectionViewController`

* From the menu bar choose `Editor → Embed in → Navigation Controller`

* Click on your navigation controller then check the box that says `Is initial View Controller` from the **Attributes Inspector**

<img width="800" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-initial.png">

* Click on your prototype cell, and set the `cell identifier` to `cell` in the **Attributes Inspector**

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-cell-id.png">

* Design the collection view's cell to match the design

	* Increase the cell size to (150x150)
	* `UIImageView` for the product image (size 150x150)
	* `UILabel` for the price label  (Font size 17, semibold, white)

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-design.png">

### Magic (Auto data-binding)

It's time to bind data between the JSON document and the UI elements.

* Open the URL in a browser [https://api.abstractlayer.com/demo/marketplace/get_items](https://api.abstractlayer.com/demo/marketplace/get_items)

* Copy the URL

* Go to your storyboard and click on your `UICollectionView` and change its class to 
`ALCollectionView` in the **Attributes Inspector**

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-class.png">

* Navigate to your **Attributes Inspector**, and you'll find a couple new attributes

* Set the number of columns to `2`

* Paste the URL you just copied in the new `Url` field

* Type in `GET` for `HTTP Method` (which is the default method)

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-url.png">

Your collection view is now ready to process the API. 

It's time to match the `JSON keys` with the `UI elements` to fill the data automatically.

* Click on your `UIImageView` and change its class to `ALImageView` in the **Identity Inspector**

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-cpimage.png">

* Type in `image_url` in the `Json Key` field so that Abstract Layer can automatically load the image using its URL value

* One more thing, give your image view a `Corner Radius` of 5 to give a more elegant look!

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-image-url.png">

* Click on the price label and change its class to `ALLabel` in the **Identity Inspector**

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price-label.png">

Type in `price` in the `Json Key` field to automatically match the JSON value with the price label. Add `$` as a prefix

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-price.png">

Run the project, and there you go! MAGIC!

<span class="important-note">Handle any kind of error by checking the <a href="/#/menu/collection-view/error-handling" target="_blank">Error handling section</a></span>

## Hold on

This looks great so far, but we're sure you've got many questions about how far can Abstract Layer go. 

<table style="width:100%">
  <tr style="height:50px">
    <td class="row-text"><b><a href="/#/menu/collection-view/error-handling" target="_blank">Error Handling</a></b><p>Handle all kind of errors when loading your collection view</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/passing-data" target="_blank">Passing Data</a></b><p>You have FULL access to parsed data, so passing it is very simple</p><br/></td>
    <td class="row-text"><b><a href="/#/menu/collection-view/parameters" target="_blank">Parameters</a></b><p>Be it Header or Body, Static or Dynamic, it's all in Interface Builder</p><br/></td> 
  </tr>

  <tr>
    <td class="row-text"><b><a href="/#/menu/collection-view/pagination" target="_blank">Pagination</a></b><p>Enabling pagination takes less than a minute</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/parsing" target="_blank">Complex JSON</a></b><p>Any form of JSON is supported, no matter how complex it is</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/loader" target="_blank">Loader</a></b><p>Enable loaders and pull-to-refresh with 2 clicks</p><br/></td> 
  </tr>
</table>

**The example below shows how you can fully customize the collection view example by modifying the parsed data before displaying it.**

### Convert label price from USD to EUR

<span class="important-note">Remember: **ALCollectionView** is a subclass of **UICollectionView**</span>

<span class="important-note">Remember: You have FULL access to the data parsed by accessing the **array** property on your collection view</span>

* Create a new class, call it `CustomCollectionViewCell`

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-cell-class.png">

* Set the collection view cell class to `CustomCollectionViewCell`

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-cell.png">

* Control-drag your price label to the class as a new outlet and call it `priceLabel`

* Don't forget to import `AbstractLayer` to the class's header

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-cell-label.png">

* Create a new class, call it `CollectionViewController` and subclass it form `UICollectionViewController`

<img width="600" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-collection-class.png">

* Set your collection view class in storyboard to `CollectionViewController`

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-custom-class.png">

* Replace the content of the class with the following:

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV">
<pre><code>
import UIKit
import AbstractLayer

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  override func collectionView(&#95; collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collection = collectionView as! ALCollectionView
    let cell = collection.cellForItem(at: indexPath) as! CustomCollectionViewCell // Get cell
    
    let item = collection.array[indexPath.row] as! [String:Any] // Get item dictionary
    var price = Float(item["price"] as! String) // Price in USD
    price = price! * 0.85 // Convert to EUR
    cell.priceLabel?.text = "€" + String(describing: price!) // Set new value
    return cell
  }
  
  override func collectionView(&#95; collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionView.numberOfItems(inSection: section)
  }
  
  func collectionView(&#95; collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collection = collectionView as! ALCollectionView
    return collection.sizeForItem(at: indexPath)
  }
}

</code></pre>
</div>


<div class="objcDIV" style="display:none;">
<pre><code>
#import "CollectionViewController.h"
#import &lt;AbstractLayer/AbstractLayer.h&gt;

@implementation CollectionViewController

- (UICollectionViewCell &#42;)collectionView:(UICollectionView &#42;)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath &#42;)indexPath {
  ALCollectionView &#42;collection = (ALCollectionView &#42;)collectionView;
  CustomCollectionViewCell &#42;cell = [collectionView cellForItemAtIndexPath:indexPath];
  
  NSDictionary &#42;item = (NSDictionary &#42;)collection.array[indexPath.row];
  CGFloat price = [item[@"price"] floatValue];
    price = price &#42; 0.85 // Convert to EUR
    cell.priceLabel.text = [NSString stringWithFormat:@"€%.2f",price]; // Set new value  
  return cell;
}

- (NSInteger)collectionView:(UICollectionView &#42;)collectionView numberOfItemsInSection:(NSInteger)section {
  return [collectionView numberOfItemsInSection:section];
}

- (CGSize)collectionView:(UICollectionView &#42;)collectionView layout:(nonnull UICollectionViewLayout &#42;)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath &#42;)indexPath {
  return [(ALCollectionView &#42;)collectionView sizeForItemAtIndexPath:indexPath];
}

@end
</code></pre>
</div>

<img width="300" alt="Collection view" src="/menu/collection-view/attachments/collection-view-main-final-euro.png">

* Run the app

## So is it really 100% customizable? Can I actually use Abstract Layer in production?

**Abstract Layer is as customizable as anything built from scratch.**

As you've seen in the example above, the framework is **fully** customizable since it's built on top of native `Apple UIKit` components like `UITableView` & `UICollectionView`.

To customize any aspect of Abstract Layer, simply:
* Subclass any of `Abstract Layer` classes to do your customizations
* Conform to the `delegate` and `datasource` protocols just as you would do with a regular `UITableView` & `UICollectionView`

<mark style="background-color: rgb(200, 235, 255);"><b>Abstract Layer is not a prototyping tool, it's strictly a production-level framework. All of our customers rely on Abstract Layer in their live apps.</b></mark>

### Where to go next?

Abstract Layer supports lots of features on `ALCollectionView`, so make sure to check them all out!

<table style="width:100%">
  <tr style="height:50px">
    <td class="row-text"><b><a href="/#/menu/collection-view/error-handling" target="_blank">Error Handling</a></b><p>Handle all kind of errors when loading your collection view</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/passing-data" target="_blank">Passing Data</a></b><p>You have FULL access to parsed data, so passing it is very simple</p><br/></td>
    <td class="row-text"><b><a href="/#/menu/collection-view/parameters" target="_blank">Parameters</a></b><p>Be it Header or Body, Static or Dynamic, it's all in Interface Builder</p><br/></td> 
  </tr>

  <tr>
    <td class="row-text"><b><a href="/#/menu/collection-view/pagination" target="_blank">Pagination</a></b><p>Enabling pagination takes less than a minute</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/parsing" target="_blank">Complex JSON</a></b><p>Any form of JSON is supported, no matter how complex it is</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/loader" target="_blank">Loader</a></b><p>Enable loaders and pull-to-refresh with 2 clicks</p><br/></td> 
  </tr>
  
    <tr>
    <td class="row-text"><b><a href="/#/menu/collection-view/xib" target="_blank">XIB</a></b><p>Reuse cells by designing them in their own XIB</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/authentication" target="_blank">Authentication</a></b><p>JWT is handled automatically once you provide your keys</p><br/></td> 
    <td class="row-text"><b><a href="/#/menu/collection-view/custom-cases" target="_blank">And More...</a></b><p>Check out the dedicated section for custom cases</p><br/></td> 
  </tr>
</table>

<span class="regular-note">Download the <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/demo/collection-view/Marketplace.zip">final project</a> and try it out!</span>