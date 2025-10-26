import 'package:flutter/material.dart';

class InactiveItem extends StatelessWidget {
  const InactiveItem({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(children: [Icon(icon, color: const Color(0xFFB77651))]),
    );
  }
}
