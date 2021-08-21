Flutter Platform Specific Code

![Screenshot_1629581525](https://user-images.githubusercontent.com/34074484/130335484-63fcf738-0c9c-4385-838f-4811fd174b23.png)
![Screenshot_1629581528](https://user-images.githubusercontent.com/34074484/130335485-6b52958a-2e6a-4f7f-9961-0cc6af8c91c9.png)
![Screenshot_1629581531](https://user-images.githubusercontent.com/34074484/130335486-d78baeed-8d91-4f10-9fab-a8424236af78.png)<br>


```
Kotlin -> 

class MainActivity: FlutterActivity() {

    private val channel = "com.example.alert_dialog"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call, _ ->
                if(call.method == "display") {
                    alertDialogBuilder()
                } 
        }
    }

    private fun alertDialogBuilder() {

        val dialog = AlertDialog.Builder(this)

        dialog.setTitle("LOGOUT")
        dialog.setMessage("Are you sure you want to logout?")
        dialog.setNegativeButton("CANCEL") {
            _, _ ->
            Toast.makeText(this, "CANCELLED", Toast.LENGTH_LONG).show()
        }
        dialog.setPositiveButton("LOGOUT") { _, _ ->
            Toast.makeText(this, "USER LOGGED OUT", Toast.LENGTH_LONG).show()
        }
        
        dialog.show()
    }
}

Flutter -> 

final platform = MethodChannel("com.example.alert_dialog");

Future<void> _displayAlertDialog() async => await platform.invokeMethod("display");

```
