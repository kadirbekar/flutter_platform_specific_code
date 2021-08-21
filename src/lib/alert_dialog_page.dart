import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertDialogPage extends StatelessWidget {
  AlertDialogPage({Key? key}) : super(key: key);

  final platform = MethodChannel("com.example.alert_dialog");

  Future<void> _displayAlertDialog() async => await platform.invokeMethod("display");

  final _baseColor = Colors.teal;

  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;

    final _appbar = AppBar(
      backgroundColor: _baseColor,
      title: Text("Alert Dialog Example"),
    );

    final _displayDialogText = Text(
      "Display Alert Dialog",
      style: TextStyle(
        fontSize: 17,
        color: Colors.white,
      ),
    );

    return Scaffold(
      appBar: _appbar,
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(
                _mediaQuery.width * 0.50,
                _mediaQuery.height * 0.08,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              _baseColor
            ),
          ),
          onPressed: _displayAlertDialog,
          child: _displayDialogText,
        ),
      ),
    );
  }
}
