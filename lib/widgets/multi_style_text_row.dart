import 'package:flutter/material.dart';

class MultiStyleTextRow extends StatelessWidget {
  const MultiStyleTextRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: 'You can set up a ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'custom domain',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: ' or connect your '),
              TextSpan(
                text: 'email service provider',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: ' to change this.'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
