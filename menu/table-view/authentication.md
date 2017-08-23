# Authentication

> Learn how to handle different types of authentication like JWT, OAuth 1.0a, OAuth 2, etc...

Currently, Abstract Layer supports JWT.
To enable it:

* Type in `JWT` in your table's attribute `Auth Type`
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
<img width="300" alt="Xcode" src="../menu/table-view/attachments/table-view-authentication.png">

### Where to go next?

Abstract Layer supports lots of features on the `ALTableView`, so make sure to check the rest out!

* [Parameters](/menu/table-view/parameters)
* [Pagination](/menu/table-view/pagination)
* [Parsing](/menu/table-view/parsing)
* [Loader & pull to refresh](/menu/table-view/loader)
* [XIB](/menu/table-view/xib)

As for customizability, Abstract Layer has a [dedicated section](/menu/table-view/custom-cases) for it.