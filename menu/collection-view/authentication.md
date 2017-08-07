# Authentication

> Learn how to handle different types of authentication like JWT

Currently, Codepack supports JWT.
To enable it:

1. Type in "JWT" in your collection's attribute "Auth Type"
2. Set the header to include both "typ" and "alg" according to JWT's standard
3. Set your secret within your "Auth Keys" attribute

> Important:
For security reasons, iit's highly recommended that you set your secret by code instead of providing it statically.

```objective-c
[[CPStore sharedInstance] setValue:@"secret" forKey:@"5c56c063897f1adec08586c4fc29f33a"];
```
<img width="300" alt="Xcode" src="/menu/collection-view/attachments/collection-view-authentication.png">

To debug your JWT token, refer to their debugger.

## Where to go next?
Check out how [customomizable](/menu/collection-view/custom-cases) collection View 