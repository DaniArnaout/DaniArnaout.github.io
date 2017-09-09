# Abstract Layer

> Abstract Layer is a native iOS framework that cuts your app development time by half!

# Getting started

* Create a new `Single View Application` Xcode project or open an existing project.

### Install framework

* <a href="https://github.com/DaniArnaout/DaniArnaout.github.io/raw/master/framework/AbstractLayerv1.0.1.zip">Download Abstract Layer framework.</a> (Installation via `Cocoaapods` will be available soon)
* **Drag** `AbstractLayer.framework` into your project and make sure `Copy items if needed` is checked
<br/><br/>
<img width="800" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-framework.png">

* Go to `General` tab under your project's target and scroll to the bottom

* <b style="color:red;">Delete</b> the framework from `Linked Frameworks and Libraries`
</ui>

* Add the framework under `Embedded Binaries`

> The framework will now appear in both `Embedded Binaries` and `Linked Frameworks and Libraries`

<img width="600" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-embedded.png">

### License key

> If you're using a trial key, check the [Trial key section](#/trial-key)

#### Activating your license:

* Download AbstractPro Manager and log in using the email and activation key you received via email

* The license status will change to "ACTIVE"

<img width="600" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-software.png">

* Go to you Xcode project, and navigate to `Build Phases`

* Tap on `+` then `Add Run Script` and ad the following line:

**./ProjectName/Abstractlayer.framework/run**

<img width="600" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-run-script.png">

* Build the project, and you're good to go

### Trial key
> To get your free trial license key, email us at <a href="mailto:support@abstractlayer.com?Subject=Free%20Trial%20Key%20Request" target="_top">support@asbtractlayer.com</a>
</p>


* Go to `info.plist` and add the following:

<img width="600" alt="Xcode" src="../../menu/getting-started/attachments/quick-start-key.png">

**Or** right-click `info.plist -> Open As -> Source Code` and paste the following:

```xml
	<key>AbstractLayer</key>
	<dict>
		<key>Key</key>
		<string><YOUR CODE></string>
	</dict>
```

### Where to go next?
You're all set, check these examples:
* [Table View](/menu/table-view/) 
* [Collection View](/menu/collection-view/)