import 'package:flutter/material.dart';
import '../../../../core/theme/extensions/color_extensions.dart';
import '../../../../core/widgets/text_widgets/text_widgets.dart';
import '../../constants/constants_widgets.dart';

enum ButtonContentType{
  text,
  textAndIcon,
}

class LargeButton extends StatelessWidget {
  final Color buttonColor;
  final Color borderColor;
  final String buttonText;
  final Function onTap;
  final double? height;
  final double? width;
  final bool centerTitle;
  final Text? text;
  final ButtonContentType buttonContentType;
  final IconData? buttonIcon;
  final Color? buttonIconColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? radius;
  const LargeButton({
    Key? key,
    this.radius,
    this.padding,
    this.centerTitle = false,
    required this.buttonColor,
    required this.onTap,
    required this.borderColor,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonContentType = ButtonContentType.text,
    this.height,
    this.width,
    this.text,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Padding(
      padding: padding ?? ConstantsWidget.onlyLeftRightPadding_35,
      child: Material(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: radius ?? ConstantsWidget.borderRadius_20,
        ),
        color: buttonColor,
        child: InkWell(
          borderRadius: radius ?? ConstantsWidget.borderRadius_20,
          onTap: () => onTap(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: radius ?? ConstantsWidget.borderRadius_20,
            ),
            height: height ?? 50,
            width: width ?? size.width,
            child: getButtonType(theme),
          ),
        ),
      ),
    );
  }

  getButtonType(ThemeData theme) {
    if (buttonContentType == ButtonContentType.text) {
      return Center(
        child: text ?? SmallText(buttonText,fontWeightEnum: FontWeightEnum.bold,color: theme.colorScheme.defaultButtonColor,),
      );
    } else {
      if (centerTitle) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(
                buttonIcon,
                color: Colors.transparent,
              ),
            ),
            FittedBox(fit: BoxFit.fill,child: text ?? SmallText(buttonText,fontWeightEnum: FontWeightEnum.bold,color: theme.colorScheme.defaultButtonTextColor,),),
            Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(
                  buttonIcon,
                  color: buttonIconColor,
                )),
          ],
        );
      } else {
        return Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            FittedBox(fit: BoxFit.fill,child: text ?? SmallText(buttonText,fontWeightEnum: FontWeightEnum.bold,color: theme.colorScheme.defaultButtonTextColor,),),
            const Spacer(),
            Icon(
              buttonIcon,
              color: buttonIconColor,
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        );
      }
    }
  }
}
