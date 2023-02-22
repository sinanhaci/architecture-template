import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final Color buttonColor;
  final Color borderColor;
  final TextStyle buttonTextStyle;
  final String buttonText;
  final Function onTap;
  final double? height;
  final double? width;
  const SmallButton({
    Key? key,
    required this.buttonColor,
    required this.onTap,
    required this.borderColor,
    required this.buttonTextStyle,
    this.height,
    this.width,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: context.radiusHight,
        ),
        color: buttonColor,
        child: InkWell(
          borderRadius: context.radiusHight,
          onTap: () => onTap(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: context.radiusHight,
            ),
            height: height ?? 50,
            width: width ?? 140,
            child: Center(
              child: Text(buttonText, style: buttonTextStyle),
            ),
          ),
        ),
      ),
    );
  }
}