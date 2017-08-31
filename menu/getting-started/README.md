# Getting started

> Follow this guide to integrate the framework into your project

### Create a new project

> If you have an existing project, skip to [Install framework](../../menu/getting-started/README?id=install-framework).

* Open Xcode and select `Create a new Xcode project`
<br/>
<img width="600" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-xcode.png">
 
* Create a `Single View Application` and hit Next
<br/>
<img width="800" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-single-view.png">

* Name your project `Conversations` and save it any place you want
<br/>
<img width="800" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-conversations.png">

### Install framework

* <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/framework/AbstractLayerv1.0.zip">Download Abstract Layer framework.</a> (Installation via `Cocoaapods` will be available soon)
* Unzip it, and drag `AbstractLayer.framework` into your project and make sure `Copy items if needed` is checked
<br/>
<img width="800" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-framework.png">

* Go to `General` tab under your project's target and scroll to the bottom

<p>
<ul><ui><b style="color:red;">Delete</b> `AbstractLayer.framework` from `Linked Frameworks and Libraries`
</ui></ul></p>

* Tap (plus) sign in `Embedded Binaries` section, and add `AbstractLayer.framework` there. 

> The framework will now appear in both `Embedded Binaries` and `Linked Frameworks and Libraries`

<img width="600" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-embedded.png">

### Get license key

After purchasing a license, you will recieve a personal key to use in your projects.

To get your free tiral license key, email us at <a href="mailto:support@abstractlayer.com?Subject=Free%20Trial%20Key%20Request" target="_top">support@asbtractlayer.com</a>
</p>

### Set license key

* Go to `info.plist` and add a new entry with key `AbstractLayer`
* Set its type to `Dictionary`
* Add a new key/value pair
* Set the key to `Key`
* Set the value to your license key

<img width="600" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-key.png">

Raw format:
```xml
	<key>AbstractLayer</key>
	<dict>
		<key>Key</key>
		<string>0B3Hwd79FbAvwesY6/xHNQnHVOinJdse23jKaE4=</string>
	</dict>
```

> The provided key in this example is just a sample. You should insert your own key instead

### Where to go next?
You're all set, check these examples:
* [Table View](/menu/table-view/) 
* [Collection View](/menu/collection-view/)