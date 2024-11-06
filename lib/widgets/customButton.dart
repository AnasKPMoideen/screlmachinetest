import 'package:flutter/material.dart';
import 'constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? borderColor;  // New parameter for border color

  const CustomButton({
    required this.text,
    required this.onTap,
    this.isPrimary = true,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.borderColor, // Allow custom border color, defaults to primaryColor if null
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? primaryColor : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor ?? (isPrimary ? primaryColor : primaryColor), // Set border color
              width: 2.0, // Border width, can be adjusted as needed
            ),
          ),
        ),
        child:Text(
          text,
          style: TextStyle(
            color: isPrimary ? Colors.white : primaryColor, // Conditional text color
          ),
        ),
      ),
    );
  }
}