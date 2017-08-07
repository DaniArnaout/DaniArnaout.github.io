# Parsing

> Learn how to handle different types of JSON

Sometimes, when your recieve JSON response, the array you want to parse is not the root of your response. In this case, you just have to type in the JSON root in your attribute inspector.

The example below shows that the array of products starts at "data.Product":

```JSON
{"meta":{"code":"200"},
 "data":{
    "Product":[{"id":"45767",
                "name":"iPhone 7",
                "description":"Brand new iPhone in mint condition.",
                "image":"https://firebasestorage.googleapis.com/v0/b/codepack-4f760.appspot.com/o/iPhone.png?alt=media&token=ae5907f8-463f-43f1-9671-cdf32e5bf9e8","price":"760"},
                {"id":"45231",
                "name":"GoPro 5",
                "description":"Used camera in good condition.",
                "image":"https://firebasestorage.googleapis.com/v0/b/codepack-4f760.appspot.com/o/Codepack.framework.zip?alt=media&token=5974f8cd-331d-42ba-94dc-72fa76e88a15","price":"333"}]}}
```
In your attribute inspector, simply add "data.Product" as a root of your JSON.

<img width="300" alt="Xcode" src="../menu/table-view/attachments/table-view-parsing.png">

## Where to go next?
Check out the other TableView tutorials like [Loader](/menu/table-view/loader) & [XIB](/menu/table-view/xib).