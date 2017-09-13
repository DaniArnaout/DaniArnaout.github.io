# Passing Data

> Learn how to pass parsed data from your table view

Within your `ALTableView` instance, there's a property called `array`. This represents the parsed array of models that populates your view.

For example, here's how you push the data of the cell the user has just tapped:

<div style="height:30px;">
<button class="objcButton" onclick="showObjc()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: darkGray;">Objective-C</button>
<button class="swiftButton" onclick="showSwift()" style="font-size: 14px; width: 100px; height: 30px; float: right; border: none; outline: none; background-color: rgb(248,248,248); color: rgb(81,148,220); font-weight:600;">Swift</button>
</div>

<div class="swiftDIV" style="background-color:rgb(248,248,248);">
<pre><code>
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let table = tableView as! ALTableView
    let item = table.array[indexPath.row]
    // You're good to go.
  }
</code></pre>
</div>


<div style="display:none; background-color:rgb(248,248,248);" class="objcDIV">
<pre><code>
- (void)tableView:(UITableView &#42;)tableView didSelectRowAtIndexPath:(NSIndexPath &#42;)indexPath {
  NSDictionary &#42;item = self.tableView.array[indexPath.row];
  // You're good to go.
}
</code></pre>
</div>