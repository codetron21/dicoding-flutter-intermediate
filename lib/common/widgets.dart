import 'package:flutter/material.dart';

Future<void> confirmOptionsDialog({
  required BuildContext context,
  required String message,
  VoidCallback? callback,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Caution'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              callback?.call();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> confirmDialog({
  required BuildContext context,
  required String message,
  VoidCallback? callback,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Information'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              callback?.call();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
