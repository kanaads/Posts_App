import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const ErrorDisplay({super.key, required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(error, style: TextStyle(color: Colors.red)),
        TextButton(onPressed: onRetry, child: Text("Retry"))
      ],
    );
  }
}
