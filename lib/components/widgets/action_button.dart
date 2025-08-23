import 'package:flutter/material.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';
import 'package:srdrbk/core/theme/text_styles/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.height,
    this.onPressed,
    this.text,
    this.borderRadius,
    this.textStyle,
    this.color,
    this.overlayColor,
    this.isMobileView = false,
  });

  final String? text;
  final double? height;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;
  final Color? color;
  final Color? overlayColor;
  final bool isMobileView;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).elevatedButtonTheme.style;
    return SizedBox(
      height: height ?? 24,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          overlayColor: overlayColor != null
              ? WidgetStatePropertyAll(overlayColor)
              : style?.overlayColor,
          backgroundColor: color != null
              ? WidgetStatePropertyAll(color)
              : style?.backgroundColor,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 6,
              horizontal: isMobileView ? 8 : 16,
            ),
          ),
        ),
        child: Text(
          text ?? '',
          style: textStyle ??
              AppTextStyles.allBody2Medium.copyWith(
                color: BaseFunctions.isDarkMode(context)
                    ? AppColors.grayDark600
                    : AppColors.grayLight600,
              ),
        ),
      ),
    );
  }
}
