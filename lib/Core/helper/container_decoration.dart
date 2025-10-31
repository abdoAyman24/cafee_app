import 'package:flutter/material.dart';

ShapeDecoration containerDecration(double borderCircler) {
  return ShapeDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.09, 0.04),
      end: Alignment(1.00, 1.00),
      colors: [const Color(0xFF383737), const Color(0xFC111010), Colors.black],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderCircler),
    ),
    shadows: [
      BoxShadow(
        color: Color(0x3F463F3F),
        blurRadius: 4,
        offset: Offset(0, 4),
        spreadRadius: 0,
      ),
    ],
  );
}
