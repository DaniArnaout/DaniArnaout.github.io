# Parameters

> Learn how to add parameters to your API request

The table view example looks cool, but there's almost no real life usage for it without sending parameters, both static & dynamic.
table-view-parameters

## Static Parameters
It's super easy to add your own parameters to any request, just type them in Parameters field in your attribute inspector.

It's the good old web format. `key1=value1&key2=value` and so on...

<img width="600" alt="Xcode" src="../menu/table-view/attachments/table-view-parameters.png">

What if you want to send dynamic parameters like current user's location? 

## Dynamic parameters
This is were you send your own case-specific parameters.
Just wrap your parameters with double curly braces like this {{latitude}}.

But where does Codepack read the value of that variable from? You pass it by calling CPStore:

```objective-c
NSString *latitude = ... // Latitude value your read from GPS
[[CPStore sharedInstance] setValue:latitude forKey:@"latitude"];
```

Don't forget to `#import <Codepack/Codepack.h>` in your class.

It's as simple as that.

## Where to go next?
Check out the other TableView tutorials like [pagination](/menu/table-view/pagination) & [parsing](/menu/table-view/parsing).