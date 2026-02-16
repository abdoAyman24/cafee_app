import 'package:flutter/material.dart';

class ClipCircle extends StatelessWidget {
  const ClipCircle({super.key, this.leftSide, this.rightSide});
  final double? leftSide;
  final double? rightSide;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftSide,
      right: rightSide,
      bottom: MediaQuery.of(context).size.height * 0.2,
      child: CircleAvatar(backgroundColor: Colors.black),
    );
  }
}
