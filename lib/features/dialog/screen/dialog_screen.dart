import 'package:flutter/material.dart';

class ConfirmOptionsDialogScreen extends Page {
  final String message;
  final VoidCallback? callbackYes;
  final VoidCallback? callbackNo;

  const ConfirmOptionsDialogScreen({
    required this.message,
    required this.callbackNo,
    required this.callbackYes,
  });

  @override
  Route createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      settings: this,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Caution'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                callbackNo?.call();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                callbackYes?.call();
              },
            ),
          ],
        );
      },
    );
  }
}

class ConfirmDialogScreen extends Page {
  final String message;
  final VoidCallback? callback;

  const ConfirmDialogScreen({
    required this.message,
    required this.callback,
  });

  @override
  Route createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      settings: this,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Information'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                callback?.call();
              },
            ),
          ],
        );
      },
    );
  }
}
