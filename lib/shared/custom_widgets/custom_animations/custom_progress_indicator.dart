import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color color;

  CustomProgressIndicator({
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
