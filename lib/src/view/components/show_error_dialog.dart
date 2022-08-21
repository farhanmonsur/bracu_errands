import 'package:flutter/material.dart';

void showErrorDialog({
  required BuildContext context,
  required String message,
  int? errorCode,
  bool showReportButton = true,
}) {
  showDialog<AlertDialog>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'ERROR!',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (errorCode != null) Text('Code: $errorCode') else Container(),
            Text(message),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
          if (showReportButton)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Report Bug'),
            )
          else
            const SizedBox.shrink(),
        ],
      );
    },
  );
}
