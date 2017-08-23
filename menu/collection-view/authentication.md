# Authentication

> Learn how to handle different types of authentication like JWT, OAuth 1.0a, OAuth 2, etc...

Currently, Abstract Layer supports JWT.
To enable it:

* Type in `JWT` in your collection's attribute `Auth Type`
* Set the header to include both `typ` and `alg` according to [JWT's standards](https://jwt.io)
* Set your secret within your `Auth Keys` attribute

> Important:
For security reasons, it's highly recommended that you set your secret by code instead of providing it statically.

Just paste in the following line of code, and set it to your actual JWT secret key
 
```Swift
ALStore.sharedInstance().setValue("5c56c063897f1adec08586c4fc29f33a", forKey: "secret")
```

```Objective-C
[[ALStore sharedInstance] setValue:@"secret" forKey:@"5c56c063897f1adec08586c4fc29f33a"];
```
<img width="300" alt="Xcode" src="../menu/collection-view/attachments/collection-view-authentication.png">

### Where to go next?

Abstract Layer supports lots of features on the `ALCollectionView`, so make sure to check the rest out!

* [Parameters](/menu/collection-view/parameters)
* [Pagination](/menu/collection-view/pagination)
* [Parsing](/menu/collection-view/parsing)
* [Loader & pull to refresh](/menu/collection-view/loader)
* [XIB](/menu/collection-view/xib)

As for customizability, Abstract Layer has a [dedicated section](/menu/collection-view/custom-cases) for it.