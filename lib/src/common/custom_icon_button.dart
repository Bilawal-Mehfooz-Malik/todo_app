import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: SizedBox(height: 40, width: 40, child: Icon(icon, color: color)),
      ),
    );
  }
}
