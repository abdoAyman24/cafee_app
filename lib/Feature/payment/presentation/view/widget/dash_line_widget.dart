import 'package:flutter/material.dart';

class DashLineWidget extends StatelessWidget {
  const DashLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.2 + 20,
      child: Row(
        children: [
          ...List.generate(
            25,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: 2,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xffB8B8B8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
