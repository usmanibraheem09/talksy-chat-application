import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.btnText, this.btnColor, this.btnWidth, this.btnHeight, required this.onTap, this.fontSize, this.isLoading = false});

  final String btnText;
  final Color? btnColor;
  final double? btnWidth;
  final double? btnHeight;
  final VoidCallback onTap;
  final double? fontSize;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: btnHeight?? 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  btnText,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
        ),
        
      ),
    );
  }
}