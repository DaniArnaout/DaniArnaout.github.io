# Custom Request

> Handle every single aspect of your request before sending it out

You can simply change the request by implementing the protocol  `ALCollectionViewLoadingDelegate`.

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV" style="background-color:rgb(248,248,248);">
<pre><code>
  func willLoadCollectionView(with request: URLRequest!) -> URLRequest! {
    let mutableRequest = ((request as NSURLRequest).mutableCopy() as? NSMutableURLRequest)!
    mutableRequest.url = URL(string:"https://api.abstractlayer.com/demo/complex/get_contacts_and_messages")
    return request
  }
</code></pre>
</div>


<div style="display:none; background-color:rgb(248,248,248);" class="objcDIV">
<pre><code>
- (NSURLRequest *)willLoadCollectionViewWithRequest:(NSURLRequest *)request {
  NSMutableURLRequest *theRequest = [request mutableCopy];
  theRequest.URL = [NSURL URLWithString:@"https://api.abstractlayer.com/demo/complex/get_contacts_and_messages"];
  return theRequest;
}
</code></pre>
</div>

Set `loadingDelegate` to one of your objects, then implement any of those methods accordingly.

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV" style="background-color:rgb(248,248,248);">
<pre><code>
collectionview.loadingDelegate = self
</code></pre>
</div>

<div style="display:none; background-color:rgb(248,248,248);" class="objcDIV">
<pre><code>
self.collectionview.loadingDelegate = self;
</code></pre>
</div>


### Where to go next?

Abstract Layer supports lots of features on the `ALcollectionview`, so make sure to check the rest out!

* [Parameters](/menu/table-view/parameters)
* [Pagination](/menu/table-view/pagination)
* [Parsing](/menu/table-view/parsing)
* [XIB](/menu/table-view/xib)
* [Authentication](/menu/table-view/authentication)

As for customizability, Abstract Layer has a [dedicated section](/menu/table-view/custom-cases) for it.