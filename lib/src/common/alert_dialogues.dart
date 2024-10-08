import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/src/utils/extensions.dart';

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showCustomAlertDialog({
  required BuildContext context,
  String? title,
  String? content,
  String? cancelActionText,
  String? defaultActionText,
}) async {
  if (kIsWeb || !Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          if (defaultActionText != null)
            ElevatedButton(
              child: Text(defaultActionText),
              onPressed: () => Navigator.of(context).pop(true),
            ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: content != null ? Text(content) : null,
      actions: [
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        if (defaultActionText != null)
          CupertinoDialogAction(
            child: Text(defaultActionText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
      ],
    ),
  );
}

/// Generic function to show a platform-aware Material or Cupertino error dialog
Future<void> showExceptionAlertDialog({
  required BuildContext context,
  String? title,
  required dynamic exception,
}) =>
    showCustomAlertDialog(
      context: context,
      title: title,
      content: exception.toString(),
      defaultActionText: context.loc.ok,
    );
