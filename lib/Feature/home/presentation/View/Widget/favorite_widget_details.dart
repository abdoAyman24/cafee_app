
import 'package:flutter/material.dart';

class FavoriteWidgetDetails extends StatelessWidget {
  const FavoriteWidgetDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      top: 15,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, 0.00),
            end: Alignment(1.00, 1.00),
            colors: [
              const Color(0xFF37373C),
              const Color(0xFF313139),
              Colors.black,
            ],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0xFF131313),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Icon(Icons.favorite_border_outlined),
      ),
    );
  }
}
