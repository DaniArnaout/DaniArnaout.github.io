# Complex JSON

> Learn how to handle different types of JSON

Sometimes, when you receive a `JSON` response, the array you want to parse is not the root of your response. 

In this case, you just have to type in the JSON root in your attribute inspector.

The example below shows that the array of products starts at "data.Product":

```JSON
{"meta":{"code":"200"},
 "data":{
    "products":[{"id":"45767",
                "name":"iPhone 7",
                "description":"Brand new iPhone in mint condition.",
                "image":"https://firebasestorage.googleapis.com/v0/b/codepack-4f760.appspot.com/o/iPhone.png?alt=media&token=ae5907f8-463f-43f1-9671-cdf32e5bf9e8","price":"760"},
                {"id":"45231",
                "name":"GoPro 5",
                "description":"Used camera in good condition.",
                "image":"https://firebasestorage.googleapis.com/v0/b/codepack-4f760.appspot.com/o/Codepack.framework.zip?alt=media&token=5974f8cd-331d-42ba-94dc-72fa76e88a15","price":"333"}]}}
```
In your attribute inspector, simply add "data.products" as a root of your JSON.

<img width="300" alt="Xcode" src="../menu/collection-view/attachments/collection-view-parsing.png">

### Where to go next?

Abstract Layer supports lots of features on the `ALCollectionView`, so make sure to check the rest out!

* [Parameters](/menu/collection-view/parameters)
* [Pagination](/menu/collection-view/pagination)
* [Loader & pull to refresh](/menu/collection-view/loader)
* [XIB](/menu/collection-view/xib)
* [Authentication](/menu/collection-view/authentication)

As for customizability, Abstract Layer has a [dedicated section](/menu/collection-view/custom-cases) for it.