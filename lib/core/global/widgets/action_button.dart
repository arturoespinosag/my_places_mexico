import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.text,
    this.textColor,
    this.leadingIcon,
    this.trailingImage,
    this.height,
    this.borderRadius = 9,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
    this.onTap,
    this.backgroundColor,
    this.boxShadow,
    this.child,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final IconData? leadingIcon;
  final ImageProvider? trailingImage;
  final double? height;
  final double borderRadius;
  final double fontSize;
  final VoidCallback? onTap;

  final FontWeight fontWeight;
  final List<BoxShadow>? boxShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: onTap == null
              ? Palette.lightGrey
              : backgroundColor ?? Palette.mainBlue,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                color: onTap == null ? Colors.black : textColor ?? Colors.white,
              ),
              const SizedBox(
                width: 9,
              ),
            ],
            Flexible(
              child: child != null
                  ? child!
                  : Text(
                      text,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: onTap == null
                            ? Colors.black.withOpacity(0.3)
                            : textColor ?? Colors.white,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                    ),
            ),
            if (trailingImage != null) ...[
              const SizedBox(width: 9),
              Image(image: trailingImage!),
            ],
          ],
        ),
      ),
    );
  }
}
