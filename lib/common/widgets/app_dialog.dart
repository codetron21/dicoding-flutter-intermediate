import 'package:flutter/material.dart';

class ConfirmOptionsDialog extends Page {
  final String message;
  final VoidCallback? callbackYes;
  final VoidCallback? callbackNo;

  const ConfirmOptionsDialog({
    required this.message,
    required this.callbackNo,
    required this.callbackYes,
  });

  @override
  Route createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(message),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      callbackNo?.call();
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      callbackYes?.call();
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class ConfirmDialog extends Page {
  final String message;
  final VoidCallback? callback;

  const ConfirmDialog({
    required this.message,
    required this.callback,
  });

  @override
  Route createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(message),
              ),
              const SizedBox(height: 8),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  callback?.call();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
