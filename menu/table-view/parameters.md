# Parameters

> Learn how to add parameters to your API request

The table view example looks cool, but there's almost no real life usage for it without sending parameters, both static & dynamic.

## Static Parameters
It's super easy to add your own parameters to any request, just type them in either `Header` or `Body` fields in your attribute inspector.

Send parameters by stating the key followed by an equal sign and the value.

Example:`key=value`

To add multiple parameters add `&` sign between them.

Example:`key1=value1&key2=value`

> Abstract Layer will automatically do the URL encoding for you if it's a `GET` http method, and format them as JSON if it's `POST`, `UPDATE`, or `DELETE` http method.

<img width="300" alt="Xcode" src="../menu/table-view/attachments/table-view-parameters.png">

What if you want to send dynamic parameters like current user's location? 

## Dynamic parameters
This is were you send your own case-specific parameters.

Just wrap your parameters with double curly braces like this {{latitude}}.

<img width="300" alt="Xcode" src="../menu/table-view/attachments/table-view-parameters-dynamic.png">

But where does Abstract Layer read the value of that variable from? You pass it by calling ALStore:

```Swift
let latitude = // Latitude value you read from GPS
ALStore.sharedInstance().setValue(latitude, forKey: "latitude")
```

```Objective-C
NSString *latitude = ... // Latitude value you read from GPS
[[ALStore sharedInstance] setValue:latitude forKey:@"latitude"];
```

Don't forget to `#import <AbstractLayer/ALStore.h>` in your class.

It's as simple as that.

### Where to go next?

Abstract Layer supports lots of features on the `ALTableView`, so make sure to check the rest out!

* [Pagination](/menu/table-view/pagination)
* [Parsing](/menu/table-view/parsing)
* [Loader & pull to refresh](/menu/table-view/loader)
* [XIB](/menu/table-view/xib)
* [Authentication](/menu/table-view/authentication)

As for customizability, Abstract Layer has a [dedicated section](/menu/table-view/custom-cases) for it.