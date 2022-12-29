import 'package:flutter/material.dart';
import '../../../../core/widgets/text_widgets/text_widgets.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  const CustomTextButton({super.key,required this.onPressed,required this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      child: SmallText(text,color: color,fontWeightEnum: FontWeightEnum.bold,),
    );
  }
}