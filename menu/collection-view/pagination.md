# Pagination

> Learn how to support pagination in 2 simple steps

In most cases, an API populated collection view includes pagination.

This means that you'll have to do the following:

* Monitor user scrolling so you load more records when the user reaches the bottom of the collection
* Keep track of the current page to send it as a parameters to load the next page
* Retrieve data, parse it, and add it to your array

Abstract Layer handles pagination automatically & magically. You only need to provide two things:

1. **Page parameter**: What is the page parameter called? (Check your backend API)
2. **Initial page number**: What's the first page number? By default it's either 0 or 1 depending on the backend API

In the example below the page parameter is called "page", and the initial page number is passed as a regular parameter `page=0`.
Don't forget to turn ON `Pagination`

<img width="300" alt="Xcode" src="../menu/collection-view/attachments/collection-view-pagination.png">

> Note: This tutorial doesn't have an up and running online server & API that you can hit. 
> Please try it on any of your existing projects.

### Where to go next?

Abstract Layer supports lots of features on the `ALCollectionView`, so make sure to check the rest out!

* [Parameters](/menu/collection-view/parameters)
* [Parsing](/menu/collection-view/parsing)
* [Loader & pull to refresh](/menu/collection-view/loader)
* [XIB](/menu/collection-view/xib)
* [Authentication](/menu/collection-view/authentication)

As for customizability, Abstract Layer has [dedicated section](/menu/collection-view/custom-cases) for it.