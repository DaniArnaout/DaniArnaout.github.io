# Debugging

There are 3 levels of console logs in Abstract Layer. 

* **Debug**: Logs out everything that Abstract Layer is doing under the hood. 

***Example:  &lt;DEBUG&gt; [AbstractLayer/URL] http://localhost:8888/v3/getNearbyProducts***

* **Error**: Only logs out errors. 

***Example: &lt;ERROR&gt; [AbstractLayer/CollectionView] Could not connect to the server.***

* **Nothing**: Logs out nothing

Set your debug level in your info.plist by adding `Abstract Layer` key, followed by `Log` key with one of the above values. (Case insensitive)

<img width="400" alt="Debug" src="/menu/debugging/attachments/debugging.png">

This is the raw value:

```xml
<key>Abstract Layer</key>
<dict>
    <key>Log</key>
    <string>Debug</string>
</dict>
```