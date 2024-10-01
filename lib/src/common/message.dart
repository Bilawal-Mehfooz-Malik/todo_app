import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  const CenteredMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
