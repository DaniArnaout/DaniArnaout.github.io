# Getting started

> Follow this guide to integrate the framework into your project

### Install framework
1. Open Xcode and select "Create a new Xcode project"
<br/>
<img width="600" alt="Xcode" src="../getting-started/attachments/quick-start-xcode.png">
 
2. Create a "Single View Application" and hit Next
<br/>
<img width="600" alt="Xcode" src="../getting-started/attachments/quick-start-single-view.png">

3. Name your project "Conversations" and save it any place you want
<br/>
<img width="600" alt="Xcode" src="../getting-started/attachments/quick-start-conversations.png">

4. Download Codepack. (Installation via Coacoapods will be available soon)
5. Drag Codepack.framework into your project and make sure "Copy items if needed" is checked
<br/>
<img width="600" alt="Xcode" src="../getting-started/attachments/quick-start-framework.png">

6. Go to general tab under your project's target and scroll to the bottom
<br/>
<img width="600" alt="Xcode" src="../getting-started/attachments/quick-start-embedded.png">

7. Delete Codepack.framework from "Linked Frameworks and Libraries"

8. Tap (plus) sign in "Embedded Binaries" section, and add Codepack there

### Get license key
Head to the dashboard to get your special license key.


### Show me the magic
As soon as you integrate the framework within your project, `UIKit` classes like `UITableViewController` will acquire extra powers, that is more attributes in the Attributes Inspector.

<img width="200" alt="Table view" src="../table-view/attachments/table-view-main-attribute-inspector.png">

### Where to go next?
Check out the [Table View](../table-view/) or the [Collection View](../collection-view/) example.