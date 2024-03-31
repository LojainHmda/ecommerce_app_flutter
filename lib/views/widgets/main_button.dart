import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.height,
      this.child,
      this.bgColor = AppColors.Primary,
      this.frColor = AppColors.white,
      this.onPressed,
      this.title})
      : assert(child != null || title != null);
  final double height;
  final Widget? child;
  final String? title;
  final Color bgColor, frColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: frColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
       onPressed: onPressed,
          child: child ?? Text(title!),
),
    );
  }
}
