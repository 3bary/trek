import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({Key? key, required this.backgroundColor, required this.text, required this.textColor, this.onPressed, required this.icon}) : super(key: key);
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final Function()? onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
          ),
        ),
        onPressed: onPressed,
        icon: icon,
        label: Text(
          text,
          style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
