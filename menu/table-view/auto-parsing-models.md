# Auto Parsing Models

> You can magically convert the parsed data from the request to your own models with a simple step

Assume you have the following JSON document of chat messages

```JSON
[{
"image_url" : https://api.abstractlayer.com/demo/siliconvalley/richardhendricks.jpg,
"timestamp" : 1508911892,
"last_message" : Thank god they use tabs!,
"name" : Richard Hendricks,
"id" : 5925b5ac22f9a51d0ca5a3ce
},
{
"image_url" : https://api.abstractlayer.com/demo/siliconvalley/guilfoyle.jpg,
"timestamp" : 1508825492,
"last_message" : This framework is better than hell.,
"name" : Guilfoyle,
"id" : 5925b5ac58cff049f195e566
},
{
"image_url" : https://api.abstractlayer.com/demo/siliconvalley/dinesh.jpg,
"timestamp" : 1508825492,
"last_message" : I can’t believe Guilfoyle actually loved something other than himself.,
"name" : Dinesh,
"id" : 5925b5ac71aef5f0f3febd4a
}]
```

And you want it to be parsed into your own custom model object **Message**.
You already a class that looks like this:


To parse the response into an array of **Message** objects, all what you have to do is type in **Message** in your attribute inspector, and Abstract Layer will hand you a fully parsed array.

<img width="300" alt="Table view" src="/menu/complex/attachments/message-class.png">

You can access the parsed array by calling the array property on your table view.

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV" style="background-color:rgb(248,248,248);">
<pre><code>
tableview.array // Array of Message objects
</code></pre>
</div>


<div style="display:none; background-color:rgb(248,248,248);" class="objcDIV">
<pre><code>
self.tableview.array // Array of Message objects
</code></pre>
</div>

### Where to go next?

Abstract Layer supports lots of features on the `ALTableView`, so make sure to check the rest out!

* [Parameters](/menu/tableview/parameters)
* [Pagination](/menu/tableview/pagination)
* [Loader & pull to refresh](/menu/tableview/loader)
* [XIB](/menu/tableview/xib)
* [Authentication](/menu/tableview/authentication)

As for customizability, Abstract Layer has a [dedicated section](/menu/tableview/customcases) for it.