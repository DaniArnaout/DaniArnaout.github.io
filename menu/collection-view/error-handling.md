# Error Handling

> This section shows you how to handle all kinds of errors when loading a collection view

* Internet connection error
* Server error
* Request error
* JSON parsing error
* Data-binding error
* Validation error

### How to handle collection view errors?

`ALCollectionView` has a new delegate designed for status update `<ALCollectionViewLoadingDelegate>`.

The delegate provides two optional protocols for will/did load.

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV" style="background-color:rgb(248,248,248);">
<pre><code>
func willLoadCollectionView()

func didLoadCollectionViewWithError(_ error: Error!)
</code></pre>
</div>


<div style="display:none; background-color:rgb(248,248,248);" class="objcDIV">
<pre><code>
- (void)willLoadCollectionView;

- (void)didLoadCollectionViewWithError:(NSError *)error;
</code></pre>
</div>

Set `loadingDelegate` to one of your objects, then implement any of those methods accordingly.

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV" style="background-color:rgb(248,248,248);">
<pre><code>
collectionView.loadingDelegate = self
</code></pre>
</div>

<div style="display:none; background-color:rgb(248,248,248);" class="objcDIV">
<pre><code>
self.collectionView.loadingDelegate = self;
</code></pre>
</div>

If the `error` object is empty, then no error occurred.

Otherwise, you can check the `error.statusCode` or print out the `error.localizedString` to check the error details.

---

### Error codes

Abstract Layer abides by HTTP status code:

* **Code 200:** Success
* **Code 204:** No Content (Empty response)
* **Code 400:** Bad Request (Error with URL, HTTP method, or parameters)
* **Code 401:** Unauthorized
* **Code 404:** Not found (API doesn't exist)
* **Code 500:** Server internal error
