package com.example.alert_dialog

import android.app.AlertDialog
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

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
